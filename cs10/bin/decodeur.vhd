-- Squelette pour l'exercice Decodeur

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity decodeur is
  port (I : in  Std_logic_vector(3 downto 0);
        Y : out Std_logic_vector(15 downto 0));
end entity;

architecture rtl of decodeur is
begin
  process(I)
  begin
    Y<=(others=>'0');
    Y(To_integer(Unsigned(I)))<='1';
    
  end process;
end architecture rtl;
