LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity MUX81 IS
	port(
		I 	: in std_logic_vector(7 downto 0);
		Y 	: out std_logic;
		SEL: in std_logic_vector(2 downto 0));
END MUX81 ;


architecture RTL of MUX81 is
begin
	process(I,SEL)
	begin
		case SEL is
			when "000" => Y<= I(0);
			when "001" => Y<= I(1);
			when "010" => Y<= I(2);
			when "011" => Y<= I(3);
			when "100" => Y<= I(4);
			when "101" => Y<= I(5);
			when "110" => Y<= I(6);
			when "111" => Y<= I(7);
			when others =>Y<= '-';
		end case;
	end process;
end architecture RTL;