library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_2x1 is
    port(w0, w1, s : in std_logic;
        output : out std_logic);
end entity;

architecture struct_multiplexer_2x1 of multiplexer_2x1 is

begin
    process(w0, w1, s)
    begin
        case s is
            when '0' =>
                output <= w0;
            when others =>
                output <= w1;
        end case;
    end process;
end architecture;
