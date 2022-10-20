LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY monotonic_counter_tb IS
END monotonic_counter_tb;

ARCHITECTURE Behavioral OF monotonic_counter_tb IS

	SIGNAL count            : INTEGER;
    SIGNAL reset : STD_LOGIC:='0';
	SIGNAL clock : STD_LOGIC;

BEGIN
	UUT : ENTITY work.monotonic_counter(Behavioral) GENERIC MAP(STOP_COUNT => 88) PORT MAP(reset => reset, clock => clock, count => count);
	reset <= '1' after 5 us;
	PROCESS
	BEGIN
		clock <= '1';
		WAIT FOR 5 ns;
		clock <= '0';
		WAIT FOR 5 ns;
        if reset = '1' then
            wait;
        end if;
	END PROCESS;

END Behavioral;