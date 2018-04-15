library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
generic (delay : time := 1 ms);
-- empty port 
end testbench;

architecture behv of testbench is
-- component declaration
component Reaction_timer 
port (ingresso : in unsigned(7 downto 0);
       reset : in std_logic;
		 Segmenti : out unsigned (27 downto 0)
       );
end component;
--inputs initialized and declared
signal reset : std_logic := '0';
signal ingresso : unsigned(7 downto 0) := "00000000";

-- output initialized and declared
signal ledr : std_logic := '0';
signal segmenti : unsigned (27 downto 0) := "0000000000000000000000000000";
begin 
uut : Reaction_timer port map (ingresso, reset, segmenti);

Stim_process : process
begin 
reset <= '1'; -- resetta
wait for  ; 
ledr <= '1'; -- inizia a contare
wait for 100 ms;
ledr <= '0'; -- si interrompe
end process;
end behv;

