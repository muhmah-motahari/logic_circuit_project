library ieee;
use ieee.std_logic_1164.all;

entity flipflopSO is
    port(so : in std_logic;
            q : out std_logic := '1');
end entity;

architecture structFliplop of flipflopSO is
    constant one : std_logic := '1';
begin
    process(so) begin
        if(so'event)then
            if (so = '1') then
                q <= '1';
            else
                q <= '0';
            end if;
        end if;
    end process;
end architecture;
