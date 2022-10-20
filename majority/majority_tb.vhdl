library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity majority_tb is
end majority_tb;

architecture Behavioral of majority_tb is

    signal m_input : std_logic_vector(2 downto 0):="000";
    signal majority_bit: std_logic:='0';

begin

UUT: entity work.majority(Behavioral1) PORT map(m_input => m_input, majority_bit => majority_bit);
    
STIMULUS: process begin
    FOR i IN 0 TO 7 LOOP
    	m_input <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, m_input'length));
        WAIT FOR 10 NS;
    END LOOP;
    WAIT;
end process;

end Behavioral;