library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Reaction_timer is
	generic ( dly : time :=1 ms;
				 
				 --period : time integer(intervallo) *dly; 
				 N : integer :=4);
	port 
		(
			clk	: in std_logic;
			ingresso : in unsigned( 7 downto 0);
			 reset: in std_logic; 
			 --Q: buffer integer;
			segmenti : out unsigned (27 downto 0)		-- 6-0--> Hex0  13-7--> Hex1  20-14-->Hex2  27-21-->Hex3
		);
		end Reaction_timer;
		
architecture struct of Reaction_timer is
signal intervallo : integer;
signal Start, Stop: std_logic; --Questo sarebbe il LEDR0//Key3
signal tempo_impiegato : integer;
signal period : time;
signal Q :integer; -- conteggio 
signal c3, c2, c1, c0 : integer; -- cifre
--signal zero: std_logic_vector( 0 downto 0);



component decoder_decimal IS
	port 
		(
			
			Q   : IN integer;
			Segmenti : OUT unsigned (6 downto 0)
		);
	end component;

begin

--zero<="0";
intervallo <=to_integer(ingresso); 
period<=intervallo * dly;

process(reset, start,stop, clk,Q)
--variable Q_var : integer;

begin
	if (reset = '1') then
		Q<=0;
			--Q <= to_integer(unsigned(zero)) ;
			Start<= '0';
			Stop <= '0';
		
			
	elsif(CLK'event and CLK='1') then --Inizio conta
			Start <= '1' after period;
			if (Start='1' and Stop = '0' and reset = '0') then
									
					Q<=Q+1;											
					c3<=Q/1000;   
					c2<=(Q/100)mod 10;
					c1<=(Q/10) mod 10;
					c0<=Q mod 10;	
					
					 if(Q > 9999) then --Condizione di perdente
						c0 <= 10;
						c1 <= 11;
						c2 <= 12;
						c3 <= 13;
						Stop <= '1';
					end if;
												
												--if (Stop ='1') then
													
														
														
													
														--tempo_impiegato<=Q_var;
														--mappatura del tempo_impiegato
														
																											
												
--												elsif(Q_var=10000) then --Scrittura di LOSE
--													
--														segmenti(6 downto 0) <= "0000100";
--														segmenti (13 downto 7) <= "0010010";
--														segmenti(20 downto 14) <= "1000000";
--														segmenti(27 downto 21) <= "1000111";												
--													
													
			end if;		
	end if;
end process;
	
													unita_display:	      decoder_decimal port map(c0,segmenti(6 downto 0)  );
													decina_display:      decoder_decimal port map(c1,segmenti(13 downto 7) );
													centinaia_display:   decoder_decimal port map(c2,segmenti(20 downto 14));
													migliaia_display:    decoder_decimal port map(c3,segmenti(27 downto 21));
end struct;
					
					
					
					
					
					