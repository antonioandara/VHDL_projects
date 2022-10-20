LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity blinky is
    port(
        blink: in std_logic;
        led: out std_logic
    );
end entity;

architecture Behavioral of blinky is
    begin
    led <= blink;
end;