library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity and_gate is
    port(
        and_input : in std_logic_vector(1 DOWNTO 0);
        and_out: out std_logic
    	);
end and_gate;
    

architecture Behavioral of and_gate is
	
    begin
        process(and_input) begin
            case(and_input) is 
                when "11" => and_out <= '1';
                when others => and_out <= '0';
            end case ;
        end process;
    
end Behavioral;