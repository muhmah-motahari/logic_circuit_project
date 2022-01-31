library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct_testbench of testbench is
	component main is
		port(input, sc, so, sb : in std_logic;
		    	EOpening, EClosing : out std_logic);
	end component;
	signal input, sc, so, sb, EOpening, EClosing : std_logic;
begin
	uut: main port map(input, sc, so, sb, EOpening, EClosing);
    input <= '0', '1' after 0.8 ns, '0' after 3 ns, '1' after 9 ns, '0' after 11 ns, '1' after 14 ns, '0' after 14.5 ns, '1' after 16 ns;
    sc <= '1', '0' after 0.89 ns, '1' after 17 ns;
    so <= '0', '1' after 7 ns, '0' after 9.09 ns;
    sb <= '0', '1' after 12 ns, '0' after 15 ns;
end architecture;
