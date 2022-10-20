library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity majority is
    port(
        m_input : in std_logic_vector(2 DOWNTO 0);
        majority_bit: out std_logic
    );
    end majority;


architecture Behavioral of majority is
    begin
        process (m_input)
        begin
            case(m_input) is
                when "000" => majority_bit <= '0';
                when "001" => majority_bit <= '0';
                when "010" => majority_bit <= '0';
                when "011" => majority_bit <= '1';
                when "100" => majority_bit <= '0';
                when "101" => majority_bit <= '1';
                when "110" => majority_bit <= '1';
                when "111" => majority_bit <= '1';
                when others => majority_bit <= '0';
            end case;
        end process;
end Behavioral;


architecture Behavioral1 of majority is

begin
	process (m_input) is begin
      case(m_input) is 
          when "011" => majority_bit <= '1';
          when "101" => majority_bit <= '1';
          when "110" => majority_bit <= '1';
          when "111" => majority_bit <= '1';
          when others => majority_bit <= '0';
      end case ;
    end process;

end Behavioral1;


architecture Behavioral2 of majority is

begin
    process (m_input) begin
        if m_input = "011" or m_input = "101" or m_input = "110" or m_input = "111" then
            majority_bit <= '1';
        else
            majority_bit <= '0';
        end if;
    end process;

end Behavioral2;


architecture Behavioral3 of majority is

begin
    with m_input select
      majority_bit <= '1' when "011",
                      '1' when "101",
                      '1' when "110",
                      '1' when "111",
                      '0' when OTHERS;
end Behavioral3;


architecture Behavioral4 of majority is
    -- these signals represent all possible permutations of any two inputs
    signal permutation_1: std_logic_vector(1 downto 0);
    signal permutation_2: std_logic_vector(1 downto 0);
    signal permutation_3: std_logic_vector(1 downto 0);
    
    begin
        -- here we assign the values of the input to the appropriate signals
        permutation_1 <= m_input(2 downto 1);
        permutation_2 <= m_input(1 downto 0);
        -- here we need to use the concatenation opeartor to get the proper permutation
        permutation_3 <= m_input(2)&m_input(0);

        process (m_input) begin
            if permutation_3 = "11" or permutation_2 = "11" or permutation_3 = "11" then
                majority_bit <= '1';
            else
                majority_bit <= '0';
            end if;
        end process;          
end Behavioral4;

    
    
architecture Structural of majority is

    signal and_1_out, and_2_out, and_3_out, or_1_out, or_2_out: std_logic:='0';
    
begin

and1: entity work.and_gate(Behavioral) port map (and_input => m_input(2 downto 1), and_out => and_1_out);
and2: entity work.and_gate(Behavioral) port map (and_input => m_input(1 downto 0), and_out => and_2_out);
and3: entity work.and_gate(Behavioral) port map (and_input(0) => m_input(0), and_input(1) => m_input(2) , and_out => and_3_out);
or1:  entity work.or_gate(Behavioral) port map (or_input(0) => and_1_out, or_input(1) => and_2_out , or_out => or_1_out);
or2:  entity work.or_gate(Behavioral) port map (or_input(0) => or_1_out, or_input(1) => and_3_out , or_out => majority_bit);

end Structural;
