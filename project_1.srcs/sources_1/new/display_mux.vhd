----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 11:17:28 PM
-- Design Name: 
-- Module Name: display_mux - Behavioral
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

entity display_mux is
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           en : in STD_LOGIC;
           dis_0 : out STD_LOGIC;
           dis_1 : out STD_LOGIC;
           dis_2 : out STD_LOGIC;
           dis_3 : out STD_LOGIC;
           dis_4 : out STD_LOGIC;
           dis_5 : out STD_LOGIC;
           dis_6 : out STD_LOGIC;
           dis_7 : out STD_LOGIC);
end display_mux;

architecture Behavioral of display_mux is
signal out_vector : STD_LOGIC_VECTOR (7 downto 0);
begin
    process (en, sel)
    begin
        if en = '0' then
            out_vector <= b"1111_1111";
        else
            case sel is
                when b"000" =>
                    out_vector <= b"0111_1111";
                when b"001" =>
                    out_vector <= b"1011_1111";
                when b"010" =>
                    out_vector <= b"1101_1111";
                when b"011" =>
                    out_vector <= b"1110_1111";
                when b"100" =>
                    out_vector <= b"1111_0111";    
                when b"101" =>
                    out_vector <= b"1111_1011";
                when b"110" =>
                    out_vector <= b"1111_1101";
                when b"111" =>
                    out_vector <= b"1111_1110";
                when others =>
                    out_vector <= b"1111_1111";
            end case;    
        end if;
        dis_0 <= out_vector(0);
        dis_1 <= out_vector(1);
        dis_2 <= out_vector(2);
        dis_3 <= out_vector(3);
        dis_4 <= out_vector(4);
        dis_5 <= out_vector(5);
        dis_6 <= out_vector(6);
        dis_7 <= out_vector(7);
    end process;
end Behavioral;
