library ieee;
use ieee.std_logic_1164.all;

entity main is
	port(input, sc, so, sb : in std_logic;
	    	EOpening, EClosing: out std_logic := '0');
end entity;

architecture struct_main of main is
	component flipflop is
		port(d, clk : in std_logic;
			q : out std_logic);
	end component;
	signal notSO : std_logic;
    signal s1 : std_logic;
begin
	notSO <= not so;
	flp0: flipflop port map(clk => input, d => sc, q => s1);
    EOpening <= notSO and s1;
end architecture;
