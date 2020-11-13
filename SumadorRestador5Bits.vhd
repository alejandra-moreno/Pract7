library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SumadorRestador5Bits is

	port (
	a : in std_logic_vector(4 downto 0); --Las entradas son de 5 bits (4 downto 0)
	b : in std_logic_vector(4 downto 0);
	s_r : in std_logic; --Indica si realizamos suma o resta
	salida_sr : out std_logic_vector(4 downto 0); --Salida de 5 bits
	ov_sr : out std_logic); --Acarreo de salida es 0 o 1

end SumadorRestador5Bits;

architecture structural of SumadorRestador5Bits is

	--Acarreos intermedios

	signal c : std_logic_vector(5 downto 0);

	component Sumador1Bit
		port (
			a_i : in std_logic; --Entradas a y b
			b_i : in std_logic;
			c_i : in std_logic; --Acarreo de entrada
			s_i : out std_logic; --Salida
			c_i_mas_1 : out std_logic); --Acarreo de salida
	end component;

begin
		c(0) <= s_r; --Acarreo inicial es 0 en la suma y 1 en la resta
		ov_sr <= (c(5) xor c(4)); --Acarreo final

		GenSum : for i in 0 to 4 generate

			i_Sumador1Bit : Sumador1Bit

			port map(
				a_i => a(i),
				b_i => (s_r xor b(i)),
				c_i => c(i),
				s_i => salida_sr(i),
				c_i_mas_1 => c(i+1));
		end generate GenSum;

end structural;
--
