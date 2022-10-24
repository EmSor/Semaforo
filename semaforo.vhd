-- J. Emilio Soriano Campos
-- Maquina de estados de tipo Moore para semaforo
library ieee;
use ieee.std_logic_1164.all;

entity semaforo is 
	port (clk, rst, start, noct : in std_logic;
			T1, T2, T3, T4, T5, T6 : in std_logic_vector(4 downto 0);
			cnt : in std_logic_vector(4 downto 0);
			EO, OE : out std_logic_vector(3 downto 0);
			NS, SN : out std_logic_vector(2 downto 0));
end entity;

architecture semaforo_ARC of semaforo is
	component MOD32 is
	port (clk, rst : in std_logic;
			count : out std_logic_vector(7 downto 0));
	end component;
	
	type ESTADOS is (S0, S1, S2, S3, S4, S5, S6);
	signal edo, edof : ESTADOS;
	
	begin
	p1 : process (clk, rst) 
		begin
		if rst = '0' then
			edo <= S0;
		elsif clk'event and clk = '1' then
			edo <= edof;
		end if;
	end process;
	
	
	p2 : process (edo, cnt, start, T1, T2, T3, T4, T5, T6)
		begin 
		case edo is
			when S0 => if start = '1' then 
								edof <= S1;
							else
								edof <= S0;
							end if;
							
			when S1 => if cnt = T1 then 
								edof <= S2;
							else
								edof <= S1;
							end if;
							
			when S2 => if cnt = T2 then
								edof <= S3;
							else
								edof <= S2;
							end if;
							
			when S3 => if cnt = T3 then
								edof <= S4;
							else
								edof <= S3;
							end if;
							
			when S4 => if cnt = T4 then
								edof <= S5;
							else
								edof <= S4;
							end if;
							
			when S5 => if cnt = T5 then
								edof <= S6;
							else
								edof <= S5;
							end if;
							
			when S6 => if cnt = T6 then
								edof <= S1;
							else
								edof <= S6;
							end if;
			when others => null;
		end case;
	end process;
	
	p3 : process (edo, noct)
		begin
		case edo is
			when S0 => if noct = '0' then 
							  EO <= "0000";
							  OE <= "0000";
							  NS <= "000";
							  SN <= "000";
						   else
							  EO <= "0000";
							  OE <= "0000";
							  NS <= "000";
							  SN <= "000";
							end if;
			
			when S1 => if noct = '0' then 
							  EO <= "1000";
							  OE <= "1000";
							  NS <= "001";
							  SN <= "001";
						   else 
							  EO <= "0100";
							  OE <= "0100";
							  NS <= "010";
							  SN <= "010";
							end if;
							
			when S2 => if noct = '0' then 
							  EO <= "0100";
							  OE <= "0100";
							  NS <= "001";
							  SN <= "001";
							else 
							  EO <= "0000";
							  OE <= "0000";
							  NS <= "000";
							  SN <= "000";
							end if;
			
			when S3 => if noct = '0' then 
							  EO <= "0001";
							  OE <= "0010";
							  NS <= "001";
							  SN <= "001";
							else 
							  EO <= "0100";
							  OE <= "0100";
							  NS <= "010";
							  SN <= "010";
							end if;
				
			when S4 => if noct = '0' then 
							  EO <= "0010";
							  OE <= "0010";
							  NS <= "100";
							  SN <= "100";
							else 
							  EO <= "0000";
							  OE <= "0000";
							  NS <= "000";
							  SN <= "000";
							end if;
			
			when S5 => if noct = '0' then 
							  EO <= "0010";
							  OE <= "0010";
							  NS <= "010";
							  SN <= "010";
							else 
							  EO <= "0100";
							  OE <= "0100";
							  NS <= "010";
							  SN <= "010";
							end if;
				
			when S6 => if noct = '0' then 
							  EO <= "0010";
							  OE <= "0001";
							  NS <= "001";
							  SN <= "001";
							else 
							  EO <= "0000";
							  OE <= "0000";
							  NS <= "000";
							  SN <= "000";
							end if;		
			when others => null;
		end case;
	end process;
end architecture;					
