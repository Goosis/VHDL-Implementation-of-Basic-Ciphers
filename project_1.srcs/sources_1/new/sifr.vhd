----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 10:18:57 AM
-- Design Name: 
-- Module Name: sifr - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sifr is
    Port ( AN : out STD_LOGIC_VECTOR (7 downto 0);
           DISP_C : out STD_LOGIC_VECTOR (6 downto 0);
           SEL_BTN_IN_R : in STD_LOGIC;
           SEL_BTN_IN_L : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST_BTN : in STD_LOGIC;
           START : out std_logic;
           INPUT : out std_logic;
           FINISH : out std_logic;
           MODE : in std_logic;
           DATA_IN : in STD_LOGIC_VECTOR (4 downto 0));
end sifr;

architecture Behavioral of sifr is
    component driver_7_seg_8_places is
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
    end component;
    
    shared variable sel : integer := 0;
    shared variable temp : integer;
    shared variable sif_num : integer range -25 to 25;
--    shared variable temp_sif : integer range -25 to 25;
    signal DISP_1 : std_logic_vector (4 downto 0);
    signal DISP_2 : std_logic_vector (4 downto 0);
    signal DISP_3 : std_logic_vector (4 downto 0);
    signal DISP_4 : std_logic_vector (4 downto 0);
    signal DISP_5 : std_logic_vector (4 downto 0);
    signal DISP_6 : std_logic_vector (4 downto 0);
    signal DISP_7 : std_logic_vector (4 downto 0);
    signal DISP_8 : std_logic_vector (4 downto 0);
    signal DISP_1_S : std_logic_vector (4 downto 0);
    signal DISP_2_S : std_logic_vector (4 downto 0);
    signal DISP_3_S : std_logic_vector (4 downto 0);
    signal DISP_4_S : std_logic_vector (4 downto 0);
    signal DISP_5_S : std_logic_vector (4 downto 0);
    signal DISP_6_S : std_logic_vector (4 downto 0);
    signal DISP_7_S : std_logic_vector (4 downto 0);
    signal DISP_8_S : std_logic_vector (4 downto 0);
begin
    display : component driver_7_seg_8_places
        port map (
            clk => CLK,
            en => '1',
            rst => '0',
            data0 => DISP_1,
            data1 => DISP_2,
            data2 => DISP_3,
            data3 => DISP_4,
            data4 => DISP_5,
            data5 => DISP_6,
            data6 => DISP_7,
            data7 => DISP_8,
            an_out => AN,
            seg_out => DISP_C
        );
    main : process (CLK)
    begin
        if rising_edge(CLK) then
            if RST_BTN = '1' then 
                DISP_1 <= (others => '1');
                DISP_2 <= (others => '1');
                DISP_3 <= (others => '1');
                DISP_4 <= (others => '1');
                
                DISP_5 <= (others => '1');
                DISP_6 <= (others => '1');
                DISP_7 <= (others => '1');
                DISP_8 <= (others => '1');
                sel := 0;
            elsif SEL_BTN_IN_R = '1' then
                sel := (sel + 1) mod 11;
            elsif SEL_BTN_IN_L = '1' then
                sel := (sel - 1) mod 11;
            else
                START <= '0';
                FINISH <= '0';
                INPUT <= '1';
                case sel is
                    when 0 => 
                        START <='1';
                        INPUT <= '0';
                    when 1 =>
                        DISP_1 <= DATA_IN;
                        DISP_1_S <= DATA_IN;
                    when 2 =>
                        DISP_2 <= DATA_IN;
                        DISP_2_S <= DATA_IN;
                    when 3 =>
                        DISP_3 <= DATA_IN;
                        DISP_3_S <= DATA_IN;
                    when 4 =>
                        DISP_4 <= DATA_IN;
                        DISP_4_S <= DATA_IN;
                    when 5 =>
                        DISP_5 <= DATA_IN;
                        DISP_5_S <= DATA_IN;
                    when 6 =>
                        DISP_6 <= DATA_IN;
                        DISP_6_S <= DATA_IN;
                    when 7 =>
                        DISP_7 <= DATA_IN;
                        DISP_7_S <= DATA_IN;   
                    when 8 =>
                        DISP_8 <= DATA_IN;
                        DISP_8_S <= DATA_IN;
                    when 10 =>
                        FINISH <= '1';
                        sif_num := integer(TO_INTEGER(unsigned(DATA_IN)));
                        if MODE = '0' then
                            sif_num := sif_num;
                        else
                            sif_num := 0 - sif_num;
                        end if;
                        if unsigned(DISP_1_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_1_S))) + sif_num) mod 26;
                            DISP_1 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        if unsigned(DISP_2_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_2_S))) + sif_num) mod 26;
                            DISP_2 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        if unsigned(DISP_3_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_3_S))) + sif_num) mod 26;
                            DISP_3 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        if unsigned(DISP_4_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_4_S))) + sif_num) mod 26;
                            DISP_4 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        
                        if unsigned(DISP_5_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_5_S))) + sif_num) mod 26;
                            DISP_5 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        if unsigned(DISP_6_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_6_S))) + sif_num) mod 26;
                            DISP_6 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        if unsigned(DISP_7_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_7_S))) + sif_num) mod 26;
                            DISP_7 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        if unsigned(DISP_8_S) < 26 then
                            temp := (integer(TO_INTEGER(UNSIGNED(DISP_8_S))) + sif_num) mod 26;
                            DISP_8 <= std_logic_vector((TO_UNSIGNED(temp, 5) mod 26));
                        end if;
                        INPUT <= '0';
                    when others => null;
                end case;
            end if;
        end if;
    end process;
end Behavioral;
