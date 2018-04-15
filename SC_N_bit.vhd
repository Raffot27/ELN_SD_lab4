library ieee;
use ieee.std_logic_1164.all;

entity SC_N_bit is  
generic ( N : integer:=16);
port(Enable,CLK, Clear: in std_logic; 
	 Segmenti0, Segmenti1, Segmenti2, Segmenti3 : out std_logic_vector (6 downto 0));
	 end SC_N_bit;
architecture struct of SC_N_bit is
signal ex, fix : std_logic_vector(N-1 downto 0);
--signal fix : std_logic;
component T_flipflop is 
port (T, CLK, Clr: in std_logic;
	 Q: out std_logic
	 );
end component;

component decoder_bin_exa
port (
			Q   : IN std_logic_vector(3 downto 0);
			Segmenti : OUT std_logic_vector (6 downto 0)
		);
end component;

begin
fix(0) <= Enable after 0.4 ns;
Flip_0 : T_flipflop port map(fix(0), Clk, Clear, ex(0));

Comp : for i in 1 to N-2 generate
fix(i) <= (fix(i-1) and ex(i-1));
Flips : T_flipflop port map (fix(i), CLK, Clear, ex(i));
end generate;

Flip_15 : T_flipflop port map ((ex(N-2) and fix(N-2)), CLK, Clear, ex(N-1));

Decod0 : decoder_bin_exa port map (ex(3 downto 0), Segmenti0);
Decod1 : decoder_bin_exa port map (ex(7 downto 4), Segmenti1);
Decod2 : decoder_bin_exa port map (ex(11 downto 8), Segmenti2);
Decod3 : decoder_bin_exa port map (ex(15 downto 12), Segmenti3);
end struct;
