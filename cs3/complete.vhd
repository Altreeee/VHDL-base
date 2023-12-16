library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LOGIC is
    port(
        J,K,L,M,N : in std_logic;
        P,Q : out std_logic;
    );
end entity;

entity ANDOR is
    port(
        A,B,C : in std_logic;
        D : out std_logic;
    );
end entity;

architecture struct of LOGIC is
    signal JKL : std_logic;
begin 
    G1: entity WORK.ANDOR port map (A=>J,B=>K,C=>L,D=>JKL);
    G2: entity WORK.ANDOR port map (A=>JKL,B=>M,C=>N,D=>Q);
    P <= JKL;
end architecture;
