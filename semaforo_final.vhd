-- J. Emilio Soriano Campos
-- Semaforo automata 
library ieee;
use ieee.std_logic_1164.all;

entity semaforo_final is
	port (clk, rst, start, noct : in std_logic;
			horario : in std_logic_vector(2 downto 0);
			EO, OE : out std_logic_vector(3 downto 0);
			NS, SN : out std_logic_vector(2 downto 0));
end entity;

architecture semaforo_final_ARC of semaforo_final is
	component MOD32 is
	port (clk, rst : in std_logic;
			count : out std_logic_vector(7 downto 0));
	end component;
	component mux_sem is 
	port (input : in std_logic_vector(2 downto 0);
			T1, T2, T3, T4, T5, T6 : out std_logic_vector(4 downto 0));
	end component;
	component semaforo is 
	port (clk, rst, start, noct : in std_logic;
			T1, T2, T3, T4, T5, T6 : in std_logic_vector(4 downto 0);
			cnt : in std_logic_vector(4 downto 0);
			EO, OE : out std_logic_vector(3 downto 0);
			NS, SN : out std_logic_vector(2 downto 0));
	end component;
	
	signal contador : std_logic_vector(7 downto 0);
	signal TI1, TI2, TI3, TI4, TI5, TI6 : std_logic_vector(4 downto 0);
	
	begin 
	I0 : MOD32 port map (clk, rst, contador);
	I1 : mux_sem port map (horario, TI1, TI2, TI3, TI4, TI5, TI6);
	I2 : semaforo port map (clk, rst, start, noct, TI1, TI2, TI3, TI4, TI5, TI6, contador(4 downto 0), EO, OE, NS, SN);
end architecture;