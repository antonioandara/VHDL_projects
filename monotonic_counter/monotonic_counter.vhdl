LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


ENTITY monotonic_counter IS
	GENERIC(STOP_COUNT: natural:=9);
	PORT (
		reset : IN  STD_LOGIC;
		clock : IN  STD_LOGIC;
		count : OUT NATURAL
	);

END ENTITY monotonic_counter;


ARCHITECTURE Behavioral OF monotonic_counter IS

	SIGNAL n : natural := 0;

BEGIN
	count <= n;
	
	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF n = STOP_COUNT or reset = '1' THEN
				n <= 0;
			ELSE
				n <= n + 1;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE Behavioral;