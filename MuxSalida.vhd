library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MuxSalida is

	port (
	salida_log : in std_logic_vector(4 downto 0); --Salida de la unidad logica
	salida_m : in std_logic_vector(4 downto 0); --Salida del multiplicador
	salida_sr : in std_logic_vector(4 downto 0); --Salida del sumador-restador
	sel_s : in std_logic_vector(1 downto 0); --Variable de control
	salida_final : out std_logic_vector(4 downto 0));

end MuxSalida;

architecture behavioral of MuxSalida is
begin

	with sel_s select
		salida_final <=
				salida_log when "00",
				salida_m when "01",
				salida_sr when "10",
				"-----" when others;

end behavioral;
