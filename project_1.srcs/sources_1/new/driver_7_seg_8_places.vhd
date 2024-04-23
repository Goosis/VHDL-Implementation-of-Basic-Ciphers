----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2024 12:19:17 AM
-- Design Name: 
-- Module Name: driver_7_seg_8_places - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity driver_7_seg_8_places is
    Port ( clk      : in    STD_LOGIC;
           en       : in    STD_LOGIC;
           rst      : in    STD_LOGIC;
           data0    : in    STD_LOGIC_VECTOR (4 downto 0);
           data1    : in    STD_LOGIC_VECTOR (4 downto 0);
           data2    : in    STD_LOGIC_VECTOR (4 downto 0);
           data3    : in    STD_LOGIC_VECTOR (4 downto 0);
           data4    : in    STD_LOGIC_VECTOR (4 downto 0);
           data5    : in    STD_LOGIC_VECTOR (4 downto 0);
           data6    : in    STD_LOGIC_VECTOR (4 downto 0);
           data7    : in    STD_LOGIC_VECTOR (4 downto 0);
           seg_out  : out   STD_LOGIC_VECTOR (6 downto 0);
           an_out   : out   STD_LOGIC_VECTOR (7 downto 0));
end driver_7_seg_8_places;

architecture Behavioral of driver_7_seg_8_places is
    component display_clock is
        Port ( clk      : in    STD_LOGIC;
               en       : in    STD_LOGIC;
               clk_word : out    STD_LOGIC_VECTOR (19 downto 0));
    end component;
    component bin_to_symb is
        Port ( bin_in   : in    STD_LOGIC_VECTOR (4 downto 0);
               clear    : in    STD_LOGIC;
               seg_data_out  : out   STD_LOGIC_VECTOR (6 downto 0);
               clk : in STD_LOGIC);
    end component;
    
    signal bin_to_convert : STD_LOGIC_VECTOR (4 downto 0);
    signal display_sel : STD_LOGIC_VECTOR (2 downto 0);
    signal clk_word : STD_LOGIC_VECTOR (19 downto 0);
begin
     converter : component bin_to_symb
        port map (
            clk => clk,
            bin_in => bin_to_convert,
            clear => rst,
            seg_data_out => seg_out
        );
        
     dis_clk : component display_clock
        port map (
            clk => clk,
            en => en,
            clk_word => clk_word
        );
    
    
    driver_data : process(clk)
    begin 
        if rising_edge(clk) then
            display_sel <= clk_word (19 downto 17);
            if rst = '1' then
               bin_to_convert <= "11111";
            else
                case display_sel is
                    when "000" => 
                        bin_to_convert <= data0;
                    when "001" =>
                        bin_to_convert <= data1;
                    when "010" =>               
                        bin_to_convert <= data2;
                    when "011" =>               
                        bin_to_convert <= data3;    
                    when "100" =>               
                        bin_to_convert <= data4;
                    when "101" =>               
                        bin_to_convert <= data5;
                    when "110" =>               
                        bin_to_convert <= data6;
                    when "111" =>               
                        bin_to_convert <= data7;
                    when others =>
                        bin_to_convert <= "11110";        
                end case;
            end if;
        end if;
    end process;
    
    driver_display : process(clk)
    begin
        if rising_edge(clk) then 
           case display_sel is
                    when "000" => 
                        an_out <= b"0111_1111";
                    when "001" =>
                        an_out <= b"1011_1111";
                    when "010" =>               
                        an_out <= b"1101_1111";
                    when "011" =>               
                        an_out <= b"1110_1111";    
                    when "100" =>               
                        an_out <= b"1111_0111";
                    when "101" =>               
                        an_out <= b"1111_1011";
                    when "110" =>               
                        an_out <= b"1111_1101";
                    when "111" =>               
                        an_out <= b"1111_1110";
                    when others =>
                        bin_to_convert <= "11110";        
                end case; 
        end if;
    end process; 
end Behavioral;
