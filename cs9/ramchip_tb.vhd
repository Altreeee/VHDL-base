library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity RamChip_tb is
    port (
        OK : out boolean := TRUE
    );
end entity;

architecture BENCH of Ramchip_tb is
    signal Address : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(15, 4));
    signal Data : std_logic_vector(7 downto 0) := (others => 'Z');
    signal nCS : std_logic := '1'; -- Chip Select
    signal nWE : std_logic := '1'; -- Write Enable
    signal nOE : std_logic := '1'; -- Output Enable, Read
begin
    Stimulus : process
    begin
        wait for 10 ns;

        nCS <= '0';
        nWE <= '0';
        nOE <= '1';
        Address <= std_logic_vector(to_unsigned(0, 4));
        Data <= std_logic_vector(to_unsigned(5, 8));
        wait for 10 ns;

        nCS <= '0';
        nWE <= '0';
        nOE <= '1';
        Address <= std_logic_vector(to_unsigned(9, 4));
        Data <= std_logic_vector(to_unsigned(3, 8));
        wait for 10 ns;

        Address <= std_logic_vector(to_unsigned(15, 4));
        Data <= (others => 'Z');
        nCS <= '1';
        nWE <= '1';
        nOE <= '1';
       wait for 10 ns;

        nCS <= '0';
        nWE <= '1';
        nOE <= '0';
        Address <= std_logic_vector(to_unsigned(0, 4));
        wait for 10 ns;
        assert  Data = std_logic_vector(to_unsigned(5, 8))
        report "erreur"
            severity note;

        nCS <= '0';
        nWE <= '1';
        nOE <= '0';
        Address <= std_logic_vector(to_unsigned(9, 4));
        wait for 10 ns;
        assert  Data = std_logic_vector(to_unsigned(3, 8))
        report "erreur"
            severity note;

        wait;
    end process;

    R : entity work.Ramchip
        port map(
            Address => Address,
            Data => Data,
            nCS => nCS,
            nWE => nWE,
            nOE => nOE
        );
end architecture;