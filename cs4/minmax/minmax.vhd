----------- Squelette de l'exercice MinMAx --------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MinMax is
  port (Min0Max1: in  STD_LOGIC;
        X, Y    : in  STD_LOGIC_VECTOR (3 downto 0);
        Z       : out STD_LOGIC_VECTOR (3 downto 0));
end entity MinMax;

architecture RTL of MinMax is
begin
  process(Min0Max1,X,Y)
  begin
    if Min0Max1 = '1' then
      if X>Y then
        Z<=X;
      elsif X<Y then
        Z<=Y;
      elsif X=Y then
        Z<=Y;
      end if;
    elsif Min0Max1 ='0' then
      if X>Y then
        Z<=Y;
      elsif X<Y then
        Z<=X;
      elsif X=Y then
        Z<=X;
      end if;
    end if;
  end process;
end architecture RTL;
