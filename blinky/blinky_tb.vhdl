LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity blinky_tb is
end entity;

architecture Behavioral of blinky_tb is
    signal blink, led: std_logic:='0';
begin

DUT: entity work.blinky(Behavioral) port map(blink=>blink, led=>led);

  blink <= not blink after 500 ms;

end;