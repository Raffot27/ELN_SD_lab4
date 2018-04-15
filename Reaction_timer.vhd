library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Reaction_timer is
	generic ( dly : time :=1 ms; 
				 --period : time integer(intervallo) *dly; 
				 N : integer :=4);
	port 
		(
			ingresso : in unsigned( 7 downto 0);
			 reset: in std_logic; 
			--Q: buffer integer;
			segmenti : out unsigned (27 downto 0)		-- 6-0--> Hex0  13-7--> Hex1  20-14-->Hex2  27-21-->Hex3
		);
		end Reaction_timer;
		
architecture struct of Reaction_timer is
signal intervallo : integer;
signal Start, Stop : std_logic; --Questo sarebbe il LEDR0//Key3
signal tempo_impiegato : integer;

signal period : time;

begin

intervallo <=to_integer(ingresso); 
period<=intervallo * dly;

process(reset, start,stop)
variable Q_var : integer;

begin
	if (reset = '1') then
		
			Q_var := 0 ;
			Start<= '0';
		
			
	else --Inizio conta
					Start <= '1' after period;
							if (Start='1') then
								
									for i IN 0 to 10000 loop  --contatore
										
											Q_var := Q_var + 1 wait dly;
											 
											
												if (Stop ='1') then
													
													
														tempo_impiegato<=Q_var;
														--mappatura del tempo_impiegato
														
														exit;
													
												
												elsif(Q_var=10000) then --Scrittura di LOSE
													
														segmenti(6 downto 0) <= "0000100";
														segmenti (13 downto 7) <= "0010010";
														segmenti(20 downto 14) <= "1000000";
														segmenti(27 downto 21) <= "1000111";
													
												
												else	--aggiornamento display
													
													--da aggiungere la parte di raffo
													
												end if;											
																			
									end loop;
								
							end if;
		end if;
	end process;
end struct;
					
					
					
					
					
					