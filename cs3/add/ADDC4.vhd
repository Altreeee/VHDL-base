LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity ADDC4 is 
port (
		I1, I2: in std_logic_vector(3 downto 0);
		CIN : in std_logic;
		SUM  : out std_logic_vector(3 downto 0); 
		COUT : out  std_logic );
end entity ADDC4;

architecture STRUCT of ADDC4 is
	signal c1,c2,c3 : std_logic;
begin
	G1:entity WORK.ADDC1 port map(Cin=>Cin,A=>I1(0),B=>I2(0),SUM=>SUM(0),Cout=>c1);
	G2:entity WORK.ADDC1 port map(Cin=>c1,A=>I1(1),B=>I2(1),SUM=>SUM(1),Cout=>c2);
	G3:entity WORK.ADDC1 port map(Cin=>c2,A=>I1(2),B=>I2(2),SUM=>SUM(2),Cout=>c3);
	G4:entity WORK.ADDC1 port map(Cin=>c3,A=>I1(3),B=>I2(3),SUM=>SUM(3),Cout=>Cout);

end architecture STRUCT;



