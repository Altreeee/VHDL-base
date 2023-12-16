library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity board is
  generic (
    AddressSize : integer := 8;  
    WordSize : integer := 16  
  );
  port (
    Address : in std_logic_vector(AddressSize-1 downto 0);  
    Data : inout std_logic_vector(WordSize-1 downto 0);       
    nCS : in std_logic;
    nWE, nOE : in std_logic
  ); 
end entity;

architecture Struct of board is
  component RamChip is
    generic (
      AddressSize : integer := 4;
      WordSize : integer := 16 
    );
    port (
      Address : in std_logic_vector(AddressSize-1 downto 0); 
      Data : inout std_logic_vector(WordSize-1 downto 0);
      nCS : in std_logic;
      nWE, nOE : in std_logic
    );
  end component;
  
  signal ADD : std_logic_vector(3 downto 0);
  signal chip_selects : std_logic_vector(15 downto 0);
begin
  chip_selects <= (others => '0');
  chip_selects(to_integer(unsigned(Address(7 downto 4)))) <= '1';
  ADD <= Address(3 downto 0);
   
  RamChips : for i in 0 to 15 generate
    Ram : entity work.RamChip
      generic map (
        AddressSize => 4, 
        WordSize => 16          
      )
      port map (
        Address => ADD,
        Data => Data(WordSize-1 downto 0),
        nCS => chip_selects(i), 
        nOE => nOE,
        nWE => nWE
      );
  end generate RamChips;
end architecture;
