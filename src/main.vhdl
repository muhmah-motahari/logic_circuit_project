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
    signal s1, s2, s3, s4, s5, s6, s7, seo, sec : std_logic;
    signal one : std_logic := '1';
    signal zero, timeout : std_logic := '0';
    signal Out2, Out1, Ready : std_logic := '0' ;
    signal bool : boolean := false;
    signal clock : std_logic := '0';
begin
    clock <= (not clock) after 10 ns;


	notSO <= not so;
    notSC <= not sc;
    s7 <= input or timeout;
	flp0: flipflop port map(clk => input, d => sc, q => s1);
    flp1: flipflop port map(clk => s7, d => so, q => s2);
    flp2: flipflop port map(clk => sb, d => notSO, q => s5);
    s6 <= s5 and notSO;
    mul0: multiplexer_2x1 port map(w0 => s1, w1 => one, s => s6, output => s3);
    mul1: multiplexer_2x1 port map(w0 => s2, w1 => zero, s => s6, output => s4);
    seo <= notSO and s3;
    sec <= notSC and s4;
    EOpening <= seo;
    EClosing <= sec;


end architecture;
