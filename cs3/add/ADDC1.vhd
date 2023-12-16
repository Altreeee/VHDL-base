LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ADDC1 is
port(
    A,B,CIN: in std_logic;
	 Cout, SUM : out std_logic
	 );
	 end entity;
	 
architecture dataflow of ADDC1 is
	begin 
	   Cout <=(Cin and A) or (Cin and B) or(A and B);
	   SUM <=CIN xor A xor B;
end architecture dataflow;