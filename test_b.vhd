library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity test_b is
port (
			clock_in : IN std_logic;
			set_time : IN unsigned (7 downto 0);
			frozen_in: IN std_logic;
			frozen_end: IN std_logic
		);
end test_b;

architecture beh of test_b is

signal clock_50_in : std_logic;
signal  frz_start, frz_end : std_logic:='0';
signal setter : unsigned(7 downto 0);
signal attesa: time:= 1 ms;
signal parti: std_logic;
--signal unit: time := 1 ms;

component interf is
port (SW : unsigned(7 downto 0);
      KEY : in std_logic_vector(3 downto 0);
		CLOCK_50 : in std_logic;
		HEX0, HEX1, HEX2, HEX3 : out unsigned(6 downto 0);
		LEDR : out unsigned(0 downto 0)
		);
end component;


begin

clock_50_in<=clock_in;
frz_start<=frozen_in;
frz_end<=frozen_end;
setter<=set_time;
setter<="00100000";
attesa<= to_integer(set_time)*1 ms;

process

 


variable cnt, j: integer :=0;

begin

wait for attesa;

for j in 0 to 20 loop


clock_50_in<='1';
wait for 10 ns;
clock_50_in<='0';
wait for 10 ns;

cnt:=cnt+1;


if (cnt=3) then -- pressione bottone
frz_start<='1';
end if;

if (cnt=17) then --fine visualizzazione

frz_end<='1';
end if;

end loop;
end process;

--saldature
edge: interf port map (SW=>setter, KEY(3)=>frz_start, KEY(2 DOWNTO 1)=>"00", KEY(0)=>frz_end, CLOCK_50=>clock_50_in);

end beh;