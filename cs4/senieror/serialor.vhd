-- Squelette de l'exercice serialor

library IEEE;
use IEEE.Std_logic_1164.all;

entity SerialOR is
  port (Clock,rst, D	: in Std_logic;
        Q		 : out Std_logic);
end entity serialOR;

architecture RTL of SerialOR is
  signal Q1,Q2,Q3,Q4: std_logic;
begin
  process(Clock,rst) 
  begin
    if rst = '1' then
      Q4 <= '0'; Q1<='0';Q2 <= '0';Q3 <= '0';
    elsif Rising_edge(Clock) then
      Q4<=Q3;
      Q3<=Q2;
      Q2<=Q1;
      Q1<=D;
      Q<=(Q1 or Q2 or Q3 or Q4);
    end if;
  end process;
end architecture RTL;



