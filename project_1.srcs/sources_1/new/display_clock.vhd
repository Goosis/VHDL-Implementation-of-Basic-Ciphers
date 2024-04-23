----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2024 12:20:22 AM
-- Design Name: 
-- Module Name: display_clock - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_clock is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clk_word : out STD_LOGIC_VECTOR (19 downto 0));
end display_clock;

architecture Behavioral of display_clock is
begin
    process (clk, en)
    variable count : STD_LOGIC_VECTOR (19 downto 0);
    begin
        if en = '1' and rising_edge(clk) then
            count := std_logic_vector(unsigned(count) + 1);
        end if;
        clk_word <= count;
    end process;
end Behavioral;
