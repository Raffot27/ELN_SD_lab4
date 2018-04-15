library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_decimal IS
	port 
		(
			
			Q   : IN integer;
			Segmenti : OUT unsigned (6 downto 0)
		);
	end decoder_decimal;
	
architecture behavior OF decoder_decimal IS
	
	begin		
		set_display: process(Q)
			Begin
			
				num_0:	if  Q = 0 then				
							Segmenti <= "1000000";
					
--				
				--num_1:
							elsif   Q = 1  then						
							Segmenti <= "1111001";
					
				--num_2:	
							elsif Q=2  then						
							Segmenti <= "0100100";
					
				--num_3:	
							elsif  Q= 3 then							
							Segmenti <= "0110000";
					
				--num_4:	
							elsif  Q= 4 then							
							Segmenti <= "0000001";
					
				--num_5:	
							elsif Q= 5  then							
							Segmenti <= "0010010";
					
				--num_6:	
							elsif Q= 6  then							
							Segmenti <= "0000010";
					
				--num_7:	
							elsif  Q= 7  then						
							Segmenti <= "1111000";
					
				--num_8:	
							elsif  Q= 8  then					
							Segmenti <= "0000000";
					
				--num_9:	
							elsif Q= 9  then
							Segmenti <= "0010000";
							
							
					--E		
							elsif Q = 10 then
						   Segmenti	<= "0000100";
							
					--S 
							elsif Q = 11 then
							Segmenti <= "0010010";
					--o
							elsif Q = 12 then 
							Segmenti <= "1000000";
					--L
							elsif Q = 13 then
							Segmenti <= "1000111";
					
				end if ;
			end process set_display;
		
end behavior;