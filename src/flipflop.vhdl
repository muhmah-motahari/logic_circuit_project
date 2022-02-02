library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
	port(d, clk : in std_logic;
	    	q : out std_logic := '0');
end entity;

architecture struct of flipflop is
begin
	process(clk)
	begin
		if clk'event and clk = '1' then
			q <= d;
		end if;
	end process;
end architecture;
