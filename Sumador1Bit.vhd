library ieee;
use ieee.std_logic_1164.all;

entity Sumador1Bit is

	port (
		a_i 			: in std_logic; --Entrada a
		b_i 			: in std_logic; --Entrada b
		c_i 			: in std_logic; --Acarreo de entrada
		s_i 			: out std_logic; --Salida
		c_i_mas_1 	: out std_logic); --Acarreo de salida
end Sumador1Bit;

architecture behavioral of Sumador1Bit is
begin

	s_i 			<= c_i xor (a_i xor b_i); --Ecuacion logica de la salida
	c_i_mas_1 	<= (a_i and b_i) or ((a_i xor b_i) and c_i); --Ecuacion logica del acarreo de salida

end behavioral;