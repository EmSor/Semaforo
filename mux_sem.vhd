library ieee;
use ieee.std_logic_1164.all;

entity mux_sem is 
	port (input : in std_logic_vector(2 downto 0);
			T1, T2, T3, T4, T5, T6 : out std_logic_vector(4 downto 0));
end entity;

architecture mux_sem_ARC of mux_sem is 
	begin 
	p1 : process(input)
		begin 
		case input is
			when "001" => T1 <= "00101"; T2 <= "01010"; T3 <= "10000"; T4 <= "10101"; T5 <= "11010"; T6 <= "11111";
			when "010" => T1 <= "01001"; T2 <= "01110"; T3 <= "10011"; T4 <= "10101"; T5 <= "11010"; T6 <= "11111";
			when "011" => T1 <= "01000"; T2 <= "01101"; T3 <= "10001"; T4 <= "10101"; T5 <= "11010"; T6 <= "11111";
			when "100" => T1 <= "00111"; T2 <= "01011"; T3 <= "01111"; T4 <= "10101"; T5 <= "11010"; T6 <= "11111";
			when "101" => T1 <= "00111"; T2 <= "01010"; T3 <= "01101"; T4 <= "10111"; T5 <= "11100"; T6 <= "11111";
			when others => null;
		end case;
	end process;
end architecture;