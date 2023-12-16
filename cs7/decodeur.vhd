-- Squelette pour l'exercice Decodeur

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity decodeur is
  port (I : in  Std_logic_vector(5 downto 0);
        --无符号二进制数
        EN: in  Std_logic;
        --EN=1:active or 0:not
        Y : out Std_logic_vector(63 downto 0));
end entity;

architecture rtl of decodeur is
begin
  process(EN,I)
  begin
    Y<=(others=>'0');
    if(EN='1') then
      Y(To_integer(Unsigned(I)))<='1';
    end if;
  end process;
end architecture rtl;
