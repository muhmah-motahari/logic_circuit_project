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
	signal notSO, notSC : std_logic;
    signal s1, s2 : std_logic;
begin
	notSO <= not so;
    notSC <= not sc;
	flp0: flipflop port map(clk => input, d => sc, q => s1);
    flp1: flipflop port map(clk => input, d => so, q => s2);
    EOpening <= notSO and s1;
    EClosing <= notSC and s2;
end architecture;
