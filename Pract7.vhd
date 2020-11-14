library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Pract7 is
   port(
   a,b : in std_logic_vector(4 downto 0);
   sel : in std_logic_vector(2 downto 0);
   ov : out std_logic;
   d0 : out std_logic_vector(6 downto 0);
   d1 : out std_logic_vector(6 downto 0));

end Pract7;

architecture structural of Pract7 is

   signal pw: std_logic_vector(7 downto 0);

   component Alu5Bits
      port(
         a,b : in std_logic_vector(4 downto 0);
         sel : in std_logic_vector(2 downto 0);
         salida_final : out std_logic_vector(4 downto 0);
         ov : out std_logic);
   end component;

   component BinA7Seg
   port (
      entrada : in std_logic_vector(3 downto 0);
      salida : out std_logic_vector(6 downto 0));
   end component;

begin

   i_Alu5Bits : Alu5Bits
      port map(
         a => a,
         b => b,
         sel => sel,
         salida_final => pw(4 downto 0),
         ov => ov);
         pw(7 downto 5) <= "000";

   i_BinA7Seg_0 : BinA7Seg
      port map (
         entrada => pw (3 downto 0),
         salida => d0);

   i_BinA7Seg_1 : BinA7Seg
      port map (
         entrada => pw(7 downto 4),
         salida => d1);

end structural;
