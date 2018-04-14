library ieee;
use ieee.STD_LOGIC_1164.all;

entity T_flipflop is
   port (T,Reset,CLK, Clr: in std_logic;
	 Q: out std_logic);
end T_flipflop;
 
architecture Behav of T_flipflop is	 
	 signal temp, a: std_logic;

    begin
    process(Reset, CLK, Clr, a)
    begin
        if(Reset = '1') then
            a <= '0';   
        elsif(Clr = '1') then
            a  <= '0';
        elsif(CLK'event and CLK='1') then
            if(T = '1') then
                temp <= not temp;
            end if;
        end if;
    end process;
    Q <= temp;
end Behav;