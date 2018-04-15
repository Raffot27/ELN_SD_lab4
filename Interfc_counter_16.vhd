library ieee;
use ieee.std_logic_1164.all;

entity Interfc is  
port(KEY, SW : in std_logic_vector(1 downto 0); 
	  HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0)
	  );
	 end Interfc;
architecture Behav of Interfc is

component SC_N_bit 
port(Enable, CLK, Clear: in std_logic; 
	 Segmenti0, Segmenti1, Segmenti2, Segmenti3 : out std_logic_vector (6 downto 0));
end component;

begin 
Counter : SC_N_bit port map (SW(1), KEY(0), SW(0), HEX0, HEX1, HEX2, HEX3 );
end Behav;
