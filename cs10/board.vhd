library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity Board is
  generic (
    BoardAddressSize : positive := 8;
    ChipAddressSize  : positive := 4;
    WordSize         : positive := 16
  );
  port (
    Address :  in std_logic_vector(BoardAddressSize - 1 downto 0);
    ram_Data    : inout std_logic_vector(WordSize - 1 downto 0);
    nWE     :  in std_logic;
    nOE     :  in std_logic
  );
end entity Board;

architecture Struct of Board is

  type RamArray is array (natural range <>) of std_logic; 
  signal rams : RamArray(0 to 15) := (others => '1'); 
  

begin
 
  Inst_RamChips: for i in 0 to 15 generate
    ram: entity work.RamChip
      port map (
        Address => Address(ChipAddressSize - 1 downto 0),
        Data => ram_data,
        nWE => nWE,
        nOE => nOE,
        nCS => rams(i)
      );
  end generate Inst_RamChips;
  
  process(Address, nOE)
    variable t : integer ;
  begin
   
      t := to_integer(unsigned(Address(BoardAddressSize - 1 downto ChipAddressSize)));
      rams <= (others => '1');
      rams(t) <= '0';
      
  end process;

end architecture;