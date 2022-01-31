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
    component multiplexer_2x1 is
        port(w0, w1, s : in std_logic;
            output : out std_logic);
    end component;

	signal notSO, notSC : std_logic;
    signal s1, s2, s3, s4 : std_logic;
    signal one : std_logic := '1';
    signal zero : std_logic := '0';
begin
	notSO <= not so;
    notSC <= not sc;
	flp0: flipflop port map(clk => input, d => sc, q => s1);
    flp1: flipflop port map(clk => input, d => so, q => s2);
    mul0: multiplexer_2x1 port map(w0 => s1, w1 => one, s => sb, output => s3);
    mul1: multiplexer_2x1 port map(w0 => s2, w1 => zero, s => sb, output => s4);
    EOpening <= notSO and s3;
    EClosing <= notSC and s4;
end architecture;
