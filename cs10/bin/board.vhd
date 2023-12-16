-- Squelette pour l'exercice carte mémoire
--final version

-- ramchip
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity ramchip is
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

architecture Behaviour of ramchip is
  type RamType is array (0 to 15) of Std_logic_vector(15 downto 0);
  signal RAM : RamType;
begin
  process(nCS, nWE, nOE)
  begin
    if nCS = '0' then
      if nWE = '0' then
        RAM(to_integer(unsigned(Address))) <= Data;
      elsif nOE = '0' then
        Data <= RAM(to_integer(unsigned(Address)));
      else
        Data <= (others => 'Z');
      end if;
    else
      Data <= (others => 'Z');
    end if;
  end process;
end architecture;
-- ramchip



library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity Board is
  generic (
    AddressSize : integer := 8;
    DataSize : integer := 16;
    RamNum : integer := 16
  );
  port (
    Address : in Std_logic_vector(AddressSize-1 downto 0);
    Data : inout Std_logic_vector(DataSize-1 downto 0);
    nWE, nOE : in Std_logic
  );
end entity Board;

architecture Struct of Board is
  signal chip_selects : Std_logic_vector(RamNum-1 downto 0);
  signal ADD : Std_logic_vector(3 downto 0);
begin
  chip_selects <= (others => '1');
  chip_selects(to_integer(unsigned(Address(7 downto 4)))) <= '0';
  
  ADD <= Address(3 downto 0);

  G1: for I in 0 to RamNum-1 generate
    C1: entity WORK.ramchip generic map (
      AddressSize => 4,
      DataSize => 16
    )
    port map (
      Address => ADD,
      Data => Data,
      nCS => chip_selects(I), 
      nWE => nWE, 
      nOE => nOE
    );
  end generate G1;

 
end architecture Struct;