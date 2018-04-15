library ieee; 
use ieee.STD_LOGIC_1164.all;

entity T_flipflop is
   generic (t_delay: time := 2 ns);
   port (T,CLK, Clr: in std_logic;
	      Q: out std_logic);
end T_flipflop;
 
architecture Behav of T_flipflop is
    
	 signal d: std_logic;
	 
    begin
	     
    process(Clr, CLK)
    begin
	  	
       if(Clr = '1') then
          d<='0';
        elsif(CLK'event and CLK='1') then 
            if(T = '1') then 
               d<= not d;
            end if;
       end if;
      
    end process;
    Q <= d after t_delay; 
end Behav;
