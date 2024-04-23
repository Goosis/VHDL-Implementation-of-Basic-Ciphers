----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2024 12:04:47 AM
-- Design Name: 
-- Module Name: bin_to_symb - Behavioral
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

entity bin_to_symb is
    Port ( bin_in : in STD_LOGIC_VECTOR (4 downto 0);
           clear : in STD_LOGIC;
           seg_data_out : out STD_LOGIC_VECTOR (6 downto 0);
           clk : in STD_LOGIC);
end bin_to_symb;

architecture Behavioral of bin_to_symb is
signal temp : STD_LOGIC_VECTOR (6 downto 0);
begin
    process (clear, bin_in, clk)
    begin
        case bin_in is
            when b"00000" => -- 0
            temp <= "0001000"; -- a
            when b"00001" => -- 1
            temp <= "1100000"; -- b
            when b"00010" => -- 2
            temp <= "0110001"; -- c
            when b"00011" => -- 3
            temp <= "1000010"; -- d
            when b"00100" => -- 4
            temp <= "0110000"; -- e
            when b"00101" => -- 5
            temp <= "0111000"; -- f
            when b"00110" => --6
            temp <= "0100001"; -- g
            when b"00111" => -- 7
            temp <= "1101000"; -- h
            when b"01000" => --8
            temp <= "1001111"; -- i
            when b"01001" =>
            temp <= "1000111"; -- j
            when b"01010" =>
            temp <= "0101000"; -- k
            when b"01011" =>
            temp <= "1110001"; -- l
            when b"01100" =>
            temp <= "0101011"; -- m
            when b"01101" =>
            temp <= "0001001"; -- n
            when b"01110" =>
            temp <= "0000001"; -- o 
            when b"01111" =>
            temp <= "0011000"; -- p
            when b"10000" =>
            temp <= "0001100"; -- q
            when b"10001" =>
            temp <= "0011001"; -- r
            when b"10010" =>
            temp <= "0100100"; -- s
            when b"10011" =>
            temp <= "1110000"; -- t
            when b"10100" =>
            temp <= "1000001"; -- u
            when b"10101" =>
            temp <= "1000101"; -- v
            when b"10110" =>
            temp <= "1010101"; -- w
            when b"10111" =>
            temp <= "1001000"; -- x
            when b"11000" =>
            temp <= "1000100"; -- y
            when b"11001" =>
            temp <= "0010110"; -- z
            when b"11111" =>
            temp <= "1111110"; -- dash symb
            when others =>
            temp <= "1111111"; -- nothing
        end case;
        seg_data_out <= temp;
    end process;
end Behavioral;
