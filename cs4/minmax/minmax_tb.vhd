----------- Squelette du Banc de Test pour l'exercice MinMax -------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MinMax_TB is
 port( OK: out boolean := TRUE);
end entity MinMax_TB;

architecture BENCH of MinMax_TB is
  signal Tmin0max1: std_logic;
  signal TX,TY,TZ : std_logic_vector(3 downto 0);
begin
  UUT: entity WORK.MinMax port map (
    Min0Max1 => Tmin0max1,
    X => TX,
    Y => TY,
    Z => TZ);
  stimulus: process
  begin
    TMin0Max1 <= '0';
    TX <= "0000";
    TY <= "0000";
    wait for 5 ns;
    assert (TZ = "0000") report "erreur" severity warning;

    TMin0Max1 <= '1';
    wait for 5 ns;
    assert (TZ = "0000") report "erreur" severity warning;
  

    TX <= "0001";
    wait for 5 ns;
    assert (TZ = "0001") report "erreur" severity warning;
    

    TMin0Max1 <= '0';
    wait for 5 ns;
    assert (TZ = "0000") report "erreur" severity warning;
  

    TY <= "0010";
    wait for 5 ns;
    assert (TZ = "0001") report "erreur" severity warning;
  

    TMin0Max1 <= '1';
    wait for 5 ns;
    assert (TZ = "0010") report "erreur" severity warning;


    TX <= "0101";
    wait for 5 ns;
    assert (TZ = "0101") report "erreur" severity warning;


    TMin0Max1 <= '0';
    wait for 5 ns;
    assert (TZ = "0010") report "erreur" severity warning;


    TY <= "1010";
    wait for 5 ns;
    assert (TZ = "0101") report "erreur" severity warning;


    TMin0Max1 <= '1';
    wait for 5 ns;
    assert (TZ = "1010") report "erreur" severity warning;
    wait;
  end process;
end architecture BENCH;
