library ieee;
use ieee.std_logic_1164.all;

entity main is
	port(input, sc : in std_logic;
	    	output : out std_logic := '0');
end entity;

architecture struct_main of main is
	component flipflop is
		port(d, clk : in std_logic;
			q : out std_logic);
	end component;
	signal notSC : std_logic;
begin
	notSC <= not sc;
	flp0: flipflop port map(clk => input,
			       d => notSC,
		       	q => output);
end architecture;

