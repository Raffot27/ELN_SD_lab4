library ieee;
use ieee.std_logic_1164.all;

entity SC_16_bit is  
generic ( N : integer:=16);
port(Enable, Reset, CLK, Clear: in std_logic; 
	 Q: out std_logic);
	 end SC_16_bit;
architecture struct of SC_16_bit is
signal ex, fix : std_logic_vector(N-1 downto 0);
--signal fix : std_logic;
component T_flipflop is 
port (T, Reset, CLK, Clr: in std_logic;
	 Q: out std_logic
	 );
end component;
begin
fix(0) <= Enable;
Flip_0 : T_flipflop port map(fix(0), Reset, Clk, Clear, ex(0));

Comp : for i in 1 to N-2 generate
fix(i) <= (fix(i-1) and ex(i-1));
Flips : T_flipflop port map (fix(i), Reset, CLK, Clear, ex(i));
end generate;

Flip_15 : T_flipflop port map ((ex(N-2) and fix(N-2)), Reset, CLK, Clear, Q);

end struct;

