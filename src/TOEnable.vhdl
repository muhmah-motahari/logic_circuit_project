library ieee;
use ieee.std_logic_1164.all;

entity toenable_logic is
    port(input, clk : in std_logic;
        output : out std_logic := '1');
end entity;

architecture rtl of toenable_logic is
    signal count1, count2 : integer := 0;
    signal bool1, bool2 : boolean := true;
    signal state : integer range 0 to 1 := 0;
begin
    process (clk) begin
        if (state = 0) then
            if (count1 < 1) then
                bool1 <= true;
            end if;
            if(count1 < 250) then
                if (input = '1' and bool1 = true) then
                    count1 <= count1 + 1;
                else
                    bool1 <= false;
                    count1 <= 0;
                end if;
            end if;
            if((count1 >= 250) and (count1 < 500)) then -- 250,000,000 Hz = 0.5 seconds
                if(input = '0' and bool1 = true) then
                    count1 <= count1 + 1;
                else
                    bool1 <= false;
                    count1 <= 0;
                end if;
            end if;
            if((count1 >= 500) and (count1 < 750)) then
                if(input = '1' and bool1 = true) then
                    count1 <= count1 + 1;
                else
                    bool1 <= false;
                    count1 <= 0;
                end if;
            end if;

            if(count1 >= 750) then
                if (bool1 = true) then
                    state <= 1;
                    bool1 <= false;
                    output <= '0';
                end if;
                count1 <= 0;
            end if;
        end if;

        if (count2 < 1) then
            bool2 <= true;
        end if;
        if (state = 1) then
            if (count2 < 500) then
               if(input = '1' and bool2 = true) then
                    count2 <= count2 + 1;
                else
                    bool2 <= false;
                    count2 <= 0;
                end if;
            end if;

            if (count2 >= 500) then
                if(input = '1' and bool2 = true) then
                    output <= '1';
                    state <= 0;
                end if;

                count2 <= 0;
            end if;
        else
            count2 <= 0;
        end if;

    end process;

end architecture;
