-- Squelette pour l'exercice Compteur
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity Counter is
  port (Clock, Reset, Enable, Load, UpDn: in Std_logic;
        Data: in Std_logic_vector(7 downto 0);
        Q:   out Std_logic_vector(7 downto 0));
end entity Counter;

-- Premi�re partie
architecture RTL of Counter is
  signal count : unsigned(7 downto 0); 
begin
  process(clock,reset)
  begin 
  if reset='1' then 
    count <= (others => '0'); 
  elsif rising_edge(clock) then 
    if Enable = '1' then 
      if Load = '1' then  
        count <= unsigned(Data); 
      else 
        if UpDn ='1' then 
          count <= count +1; 
        else 
          count <= count -1; 
        end if; 
      end if; 
    end if; 
  end if; 
  end process; 

  Q <= std_logic_vector(count); 

end architecture;

-- Deuxi�me partie
--Modifier le compteur pour coder un reset synchrone (et non asynchrone). 
architecture RTL2 of Counter is
  signal count : unsigned(7 downto 0); 
  begin
    process(clock)
    begin 
    if rising_edge(clock) then 
    if reset='1' then 
      count <= (others => '0'); 
    else
      if Enable = '1' then 
        if Load = '1' then  
          count <= unsigned(Data); 
        else 
          if UpDn ='1' then 
            count <= count +1; 
          else 
            count <= count -1; 
          end if; 
        end if; 
      end if;
    end if; 
    end if; 
    end process; 
  
    Q <= std_logic_vector(count); 

end architecture;

-- Troisi�me partie
architecture RingCounter of Counter is
  signal count : unsigned(7 downto 0); 
begin
  process(clock,reset)
  begin 
  if reset='1' then 
    count <= "00000001";
  elsif rising_edge(clock) then 
    if Enable = '1' then 
      if Load = '1' then  
        count <= unsigned(Data); 
      else 
        if UpDn ='1' then 
          -- decalage a gauche
          count <= count(6 downto 0)&'0'; -- count <= count sll 1; 
          if count ="10000000" then   
            count <= "00000001"; 
          end if; 
        else 
          -- decalage a droite
          count <= '0'&count(7 downto 1); --count <= count srl 1; 
          if count ="00000001" then   
            count <= "10000000"; 
          end if; 
        end if; 
      end if; 
    end if; 
  end if; 
  end process; 

  Q <= std_logic_vector(count); 

end architecture;