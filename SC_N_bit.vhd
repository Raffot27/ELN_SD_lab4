library ieee;
use ieee.std_logic_1164.all;

entity SC_n_bit is  
generic ( N : integer:=4);
port(Enable, CLK, Clear: in std_logic; 
	 Q: out std_logic_vector( N-1 downto 0)
	 );
	 end SC_n_bit;
	 
architecture str of SC_n_bit is
signal ex, fix : std_logic_vector(N-1 downto 0);

component T_flipflop is 
port (T, CLK, Clr: in std_logic;
	    Q: out std_logic
	 );
end component;
begin 
Q<=ex;
fix(0) <= Enable;
Flip_0 : T_flipflop port map(fix(0), Clk, Clear, ex(0));

Comp : for i in 1 to N-2 generate
fix(i) <= (fix(i-1) and ex(i-1));
Flips : T_flipflop port map (fix(i), CLK, Clear, ex(i));
end generate;

Flip_n : T_flipflop port map ((ex(N-2) and fix(N-2)), CLK, Clear, ex(N-1));

end str;
