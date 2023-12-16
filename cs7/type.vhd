library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

--类型转换+计算

Entity ADDER is
port( 
    A : in STD_LOGIC_VECTOR(7 downto 0);
    B : in INTEGER;
    C : in SIGNED(7 downto 0));
SUM : out STD_LOGIC_VECTOR(7 downto 0);
end entity;

Architecture BEHAVIOUR of ADDER is
Begin
SUM <= STD_LOGIC_VECTOR(Signed(A,8)+To_signed(B,8)+C);
--signed和unsighed是二进制数，integer是整数
End architecture;



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
entity Mux8to1 is
port( Address : in STD_LOGIC_VECTOR(2 downto 0);
IP : in STD_LOGIC_VECTOR(7 downto 0);
OP : out STD_LOGIC);
end entity;
architecture BEHAVIOUR of Mux8to1 is
begin
OP <=IP(To_integer(Unsigned(Address)));
--Address是二进制数，指明地址
end architecture ;