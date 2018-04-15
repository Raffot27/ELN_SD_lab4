library ieee;
use ieee.std_logic_1164.all;

entity Interfc is  
port(SW: in std_logic_vector(1 downto 0);
      CLOCK_50 : in std_logic; 
	  HEX0: out std_logic_vector(6 downto 0)
	  );
	 end Interfc;
architecture Behav of Interfc is

component flashing_digit_0_to_9 
port(Enable, CLK, reset: in std_logic; 
	 Segmenti: out std_logic_vector (6 downto 0));
end component;

begin 
Counter : flashing_digit_0_to_9  port map (SW(1), CLOCK_50, SW(0), HEX0 );
end Behav;