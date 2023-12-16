-- Squelette pour l'exercice RamChip

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Ramchip is
  generic (
    AddressSize : integer := 4;
    DataSize : integer := 16
  );
  port (
    Address : in Std_logic_vector(AddressSize-1 downto 0);
    Data : inout Std_logic_vector(DataSize-1 downto 0);
    nCS, nWE, nOE : in Std_logic
  );
end entity;

architecture Behaviour of RamChip is
  type RamType is array (0 to 15) of Std_logic_vector(15 downto 0);
  
  signal RAM : RamType;
begin 
  process (address,data,nCs,nWE,nOE)
    subtype T is STD_LOGIC_VECTOR(0 to 2);
  begin
    
    case T'(nCS & nWE & nOE) is
      when "001" => RAM(To_integer(Unsigned(Address)))<= Data;
      when "010" => Data <= RAM(To_integer(Unsigned(Address)));
      when others => Data <=(others => 'Z');
    end case;
  end process;
 end architecture;
  

