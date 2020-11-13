library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnidadControl is

	port(
	sel : in std_logic_vector(2 downto 0);
	sel_s : out std_logic_vector(1 downto 0);
	sel_ov : out std_logic;
	s_r : out std_logic;
	sel_b : out std_logic;
	sel_log : out std_logic_vector(1 downto 0));

end UnidadControl;

architecture behavioral of UnidadControl is
begin

	with sel select
		sel_s <=
			"00" when "000", --A and B
			"00" when "001", --A or B
			"00" when "010", --A xor B
			"00" when "011", --not A
			"10" when "100", --A+B
			"10" when "101", --A-B
			"10" when "110", --A+1
			"01" when "111", --AxB
			"--" when others;

	--Ecuaciones obtenidas con Karnaugh
	sel_ov <= sel(0) and sel(1);
	s_r <= sel(0);
	sel_b <= sel(1);
	sel_log <= sel(1 downto 0);

end behavioral;
