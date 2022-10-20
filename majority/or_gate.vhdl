library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity or_gate is
    port(
        or_input : in std_logic_vector(1 DOWNTO 0);
        or_out: out std_logic
    	);
end or_gate;
    

architecture Behavioral of or_gate is
	
    begin
        process(or_input) is begin
            case(or_input) is 
                when "00" => or_out <= '0';
                when others => or_out <= '1';
            end case ;
        end process;
    
end Behavioral;