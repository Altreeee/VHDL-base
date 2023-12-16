LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ramchip_tb is
    
end entity ramchip_tb;
    
architecture Bench of ramchip_tb is
    signal Address: Std_logic_vector(3 downto 0);
    signal Data: Std_logic_vector(7 downto 0);
    signal nCS, nWE, nOE:Std_logic;
    
begin
    UUT: entity WORK.RamChip port map (
        Address => Address,
        Data => Data,
        nCS=>nCS, 
        nWE=>nWE, 
        nOE=>nOE
    );
    stimulus: process
    begin
        Address <= (others => '0');
        Data <= (others => 'Z');
        nCS <= '1';
        nWE <= '1';
        nOE <= '1';

        nCS<='0';

        --写入
        Data <= "11110000";
        Address <= "0000";
        nWE<='0';
        wait for 5 ns;
        Data <= (others => 'Z');
        nWE<='1';
       

        --读取
        Address <= "0000";
        nOE<='0';
        assert Data="11110000" report "erreur" severity warning;
        Data <= (others => 'Z');
        nOE<='1';


        --写入
        Address <= "1001";
        Data <= "11100001";
        nWE<='0';
        wait for 5 ns;
        Data <= (others => 'Z');
        nWE<='1';
        

        --读取
        Address <= "1001";
        nOE<='0';
        assert Data="11100001" report "erreur" severity warning;
        Data <= (others => 'Z');
        nOE<='1';


        wait;
    end process;

end architecture Bench;