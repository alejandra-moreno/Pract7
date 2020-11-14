library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MuxSelB1 is

   port (
   b : in std_logic_vector(4 downto 0);
   sel_b : in std_logic; --Indica si la salida sera b o 1
   salida_muxb : out std_logic_vector(4 downto 0));

end MuxSelB1;

architecture behavioral of MuxSelB1 is
begin

process(b)

begin
   if sel_b = '0' then
      salida_muxb <= b;
   elsif sel_b = '1' then
      salida_muxb <= "00001";
   else
      null;
   end if;

end process;

end behavioral;
