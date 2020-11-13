library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Alu5Bits is
	port(
	a,b : in std_logic_vector(4 downto 0);
	sel : in std_logic_vector(2 downto 0);
	salida_final : out std_logic_vector(4 downto 0);
	ov : out std_logic);

end Alu5Bits;

architecture structural of Alu5Bits is

	signal sel_s, sel_log : std_logic_vector(1 downto 0);
	signal sel_ov, s_r, sel_b : std_logic;
	signal salida_log, salida_m, salida_sr : std_logic_vector(4 downto 0);
	signal salida_muxb : std_logic_vector(4 downto 0);
	signal ov_p, ov_sr : std_logic;

	component UnidadControl
		port(
			sel : in std_logic_vector(2 downto 0);
			sel_s : out std_logic_vector(1 downto 0);
			sel_ov : out std_logic;
			s_r : out std_logic;
			sel_b : out std_logic;
			sel_log : out std_logic_vector(1 downto 0));
	end component;

	component UnidadLogica
		port(
			a,b : in std_logic_vector(4 downto 0);
			sel_log : in std_logic_vector(1 downto 0);
			salida_log : out std_logic_vector(4 downto 0));
	end component;

	component Multiplicador5Bits
		port(
			a,b : in std_logic_vector(4 downto 0);
			salida_m : out std_logic_vector(4 downto 0);
			ov_p : out std_logic); --Indica si hay acarreo
	end component;

	component SumadorRestador5Bits
		port (
			a : in std_logic_vector(4 downto 0); --Las entradas son de 5 bits (4 downto 0)
			b : in std_logic_vector(4 downto 0);
			s_r : in std_logic; --Indica si realizamos suma o resta
			salida_sr : out std_logic_vector(4 downto 0); --Salida de 5 bits
			ov_sr : out std_logic); --Acarreo de salida es 0 o 1
	end component;

	component MuxSelB1
		port (
			b : in std_logic_vector(4 downto 0);
			sel_b : in std_logic; --Indica si la salida sera b o 1
			salida_muxb : out std_logic_vector(4 downto 0));
	end component;

	component MuxOverflow
		port (
			ov_p : in std_logic; --Overflow del producto
			ov_sr : in std_logic; --Overflow del sumador-restador
			sel_ov : in std_logic; --Indica si mostrar el overflow
			ov : out std_logic); --Indica si hay overflow
	end component;

	component MuxSalida
		port (
			salida_log : in std_logic_vector(4 downto 0); --Salida de la unidad logica
			salida_m : in std_logic_vector(4 downto 0); --Salida del multiplicador
			salida_sr : in std_logic_vector(4 downto 0); --Salida del sumador-restador
			sel_s : in std_logic_vector(1 downto 0); --Variable de control
			salida_final : out std_logic_vector(4 downto 0));
	end component;

begin

	i_UnidadControl : UnidadControl
		port map(
			sel => sel,
			sel_s => sel_s,
			sel_ov => sel_ov,
			s_r => s_r,
			sel_b => sel_b,
			sel_log => sel_log);

	i_UnidadLogica : UnidadLogica
		port map(
			a => a,
			b => b,
			sel_log => sel_log,
			salida_log => salida_log);

	i_Multiplicador : Multiplicador5Bits
		port map(
			a => a,
			b => b,
			salida_m => salida_m,
			ov_p => ov_p);

	i_SumadorRestador : SumadorRestador5Bits
		port map(
			a => a,
			b => salida_muxb,
			s_r => s_r,
			salida_sr => salida_sr,
			ov_sr => ov_sr);

	i_MuxOverflow : MuxOverflow
		port map(
		ov_p => ov_p,
		ov_sr => ov_sr,
		sel_ov => sel_ov,
		ov => ov);

	i_MuxSalida : MuxSalida
		port map (
			salida_log => salida_log,
			salida_m => salida_m,
			salida_sr => salida_sr,
			sel_s => sel_s,
			salida_final => salida_final);

	i_MuxSelB1 : MuxSelB1
		port map (
			b => b,
			sel_b => sel_b,
			salida_muxb => salida_muxb);

end structural;
