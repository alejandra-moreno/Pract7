library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Multiplicador5Bits is

	port(
	a,b : in std_logic_vector(4 downto 0);
	salida_m : out std_logic_vector(4 downto 0);
	ov_p : out std_logic); --Indica si hay acarreo

end Multiplicador5Bits;

architecture behavioral of Multiplicador5Bits is
	signal producto : std_logic_vector(9 downto 0);
begin
	producto <= std_logic_vector(signed(a)*signed(b));
	salida_m <= producto(4 downto 0);

	--Para el overflow comprobamos si hay extension de signo
	process(producto)
		begin
			if producto(9 downto 4) = "000000" then
				ov_p <= '0';
			elsif producto(9 downto 4) = "111111" then
				ov_p <= '0';
			else
				ov_p <= '1';
			end if;
	end process;

end behavioral;
