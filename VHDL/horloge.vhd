library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_10MHz is
    Port ( clk : out  STD_LOGIC);
end clock_10MHz;

architecture Behavioral of clock_10MHz is
begin
    process
    begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;
end Behavioral;
