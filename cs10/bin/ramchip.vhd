library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ramchip is
  port (
    Address : in std_logic_vector(3 downto 0);
    Data : inout std_logic_vector(7 downto 0);
    nCS, nWE, nOE : in std_logic
  );
end entity;

architecture Behaviour of ramchip is
  type RamType is array (0 to 15) of std_logic_vector(7 downto 0);
  signal RAM : RamType;
begin
  process(nCS, nWE, nOE)
  begin
    if nCS = '0' then
      if nWE = '0' then -- Modified condition from nWE = '1'
        RAM(to_integer(unsigned(Address))) <= Data;
      elsif nOE = '0' then -- Modified condition from nOE = '1'
        Data <= RAM(to_integer(unsigned(Address)));
      else
        Data <= (others => 'Z'); -- Added else statement to set Data bus to high-impedance state
      end if;
    else
      Data <= (others => 'Z'); -- Added else statement to set Data bus to high-impedance state
    end if;
  end process;
end architecture;
