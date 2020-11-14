library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnidadLogica is

   port(
   a,b : in std_logic_vector(4 downto 0);
   sel_log : in std_logic_vector(1 downto 0);
   salida_log : out std_logic_vector(4 downto 0));

end UnidadLogica;

architecture behavioral of UnidadLogica is
begin

      with sel_log select
         salida_log <=
            (a and b) when "00",
            (a or b) when "01",
            (a xor b) when "10",
            (not a) when "11",
            "00000" when others;

end behavioral;
