library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct_testbench of testbench is
	component main is
		port(input, sc, so, sb, TOEnable : in std_logic := '0';
		    	EOpening, EClosing : out std_logic := '0');
	end component;
	signal input, sc, so, sb, TOEnable, EOpening, EClosing : std_logic := '0';
begin
	uut: main port map(input, sc, so, sb, TOEnable, EOpening, EClosing);
    input <= '0', '1' after 0.8 ns, '0' after 3 ns, '1' after 80 ns , '0' after 81 ns;
    sc <= '1', '0' after 0.89 ns, '1' after 70 ns, '0' after 82 ns;
    so <= '0', '1' after 20 ns, '0' after 50 ns, '1' after 90 ns;
    sb <= '0';
    TOEnable <= '1' after 10 ns, '0' after 2500 ns, '1' after 5000 ns, '0' after 7500 ns;
end architecture;
