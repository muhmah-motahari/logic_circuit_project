library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct_testbench of testbench is
	component main is
		port(input, sc : in std_logic;
		    	output : out std_logic);
	end component;
	signal input, sc, output : std_logic;
begin
	uut: main port map(input, sc, output);
	input <= '1', '0' after 3 ns, '1' after 4 ns, '0' after 6 ns, '1' after 12 ns, '0' after 15 ns, '1' after 17 ns;
	sc <= '0', '1' after 10 ns,'0' after 11.3 ns, '1' after 15 ns, '0' after 20 ns;
end architecture;

