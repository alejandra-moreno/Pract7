library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MuxOverflow is

	port (
	ov_p : in std_logic; --Overflow del producto
	ov_sr : in std_logic; --Overflow del sumador-restador
	sel_ov : in std_logic; --Indica si mostrar el overflow
	ov : out std_logic); --Indica si hay overflow

end MuxOverflow;

architecture behavioral of MuxOverflow is
begin

	with sel_ov select
		ov <=
			ov_sr when '0',
			ov_p when '1',
			'-' when others;

end behavioral;
