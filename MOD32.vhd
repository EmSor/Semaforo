-- J. Emilio Soriano Campos
-- Contador de modulo 32
library ieee;
use ieee.std_logic_1164.all;

entity MOD32 is
	port (clk, rst : in std_logic;
			count : out std_logic_vector(7 downto 0));
end entity;

architecture MOD32_ARC of MOD32 is
	component CNT8 is 
	port (clk, rst : in std_logic;
			count : out std_logic_vector(7 downto 0));
	end component;
	
	signal rst_int : std_logic;
	signal Q : std_logic_vector(7 downto 0);
	
	begin 
	I0 : CNT8 port map (clk, rst_int, Q);
	
	P1 : process (rst, Q)
		begin
		case rst is 
			when '0' => rst_int <= '0';
			when others => if Q = "00100000" then 
									rst_int <= '0';
								else 
									rst_int <= '1';
								end if;
		end case;
	end process;
	count <= Q;
end architecture;
		  