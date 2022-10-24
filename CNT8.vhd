-- J. Emilio Soriano Campos
-- Contador de 8 bits
library ieee;
use ieee.std_logic_1164.all;

entity CNT8 is 
	port (clk, rst : in std_logic;
			count : out std_logic_vector(7 downto 0));
end entity;

architecture CNT8_ARC of CNT8 is
	component MASUNO8 is 
	port (A : in std_logic_vector(7 downto 0);
			Z : out std_logic_vector(7 downto 0));
	end component;
	
	signal D, Q : std_logic_vector(7 downto 0);
	
	begin 
	I0 : MASUNO8 port map (Q, D);
	count <= Q;
	
	P1 : process(clk, rst)
		begin
		if rst = '0' then
			Q <= "00000000";
		elsif clk'event and clk = '1' then
			Q <= D;
		end if;
	end process;
end architecture;