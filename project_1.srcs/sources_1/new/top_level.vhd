----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2024 01:32:31 AM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC : in std_logic;
           BTNU : in std_logic;
           BTNL : in std_logic;
           BTNR : in std_logic;
           LED16_B : out STD_LOGIC;
           LED16_R : out STD_LOGIC;
           LED16_G : out STD_LOGIC;
           LED17_G : out std_logic;
           LED17_R : out std_logic;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CD : out STD_LOGIC;
           CC : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           SW : in std_logic_vector (4 downto 0);
           SW15 : in std_logic;
           LED : out std_logic_vector (7 downto 0);
           JA : out std_logic_vector (4 downto 1);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end top_level;

architecture Behavioral of top_level is
    component sifr is
    Port ( AN : out STD_LOGIC_VECTOR (7 downto 0);
           DISP_C : out STD_LOGIC_VECTOR (6 downto 0);
           SEL_BTN_IN_R : in STD_LOGIC;
           SEL_BTN_IN_L : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST_BTN : in STD_LOGIC;
           FINISH: out STD_LOGIC;
           START : out STD_LOGIC;
           INPUT : out STD_LOGIC;
           MODE : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component debounce is
    port (
        clk      : in    std_logic; --! Main clock
        rst      : in    std_logic; --! High-active synchronous reset
        en       : in    std_logic; --! Clock enable input
        bouncey  : in    std_logic; --! Bouncey button input
        clean    : out   std_logic; --! Debounced button output
        pos_edge : out   std_logic; --! Positive-edge (rising) impulse
        neg_edge : out   std_logic  --! Negative-edge (falling) impulse
    );
    end component;
    
    signal sel_btn_r : std_logic;
    signal sel_btn_l : std_logic;
begin
--    display : component driver_7_seg_8_places
--        port map (
--            clk => CLK100MHZ,
--            en => '1',
--            rst => BTNC,
--            data0 => "00000",
--            data1 => "00001",
--            data2 => "00010",
--            data3 => "00011",
--            data4 => "00100",
--            data5 => "00101",
--            data6 => "00110",
--            data7 => "00111",
--            an_out => AN,
--            seg_out(6) => CA,
--            seg_out(5) => CB,
--            seg_out(4) => CC,
--            seg_out(3) => CD,
--            seg_out(2) => CE,
--            seg_out(1) => CF,
--            seg_out(0) => CG
--        );
    btn_r : component debounce
        port map (
            clk => CLK100MHZ,
            rst => BTNU,
            en => '1',
            bouncey => BTNR,
            clean => open,
            neg_edge => open,
            pos_edge => sel_btn_r
        );
        
    btn_l : component debounce
        port map (
            clk => CLK100MHZ,
            rst => BTNU,
            en => '1',
            bouncey => BTNL,
            clean => open,
            neg_edge => open,
            pos_edge => sel_btn_l
        );
        
    display_2 : component sifr
        port map (
            AN => AN,
            SEL_BTN_IN_R => sel_btn_r,
            SEL_BTN_IN_L => sel_btn_l,
            clk => CLK100MHZ,
            rst_btn => BTNU,
            data_in => SW,
            DISP_C(6) => CA,
            DISP_C(5) => CB,
            DISP_C(4) => CC,
            DISP_C(3) => CD,
            DISP_C(2) => CE,
            DISP_C(1) => CF,
            DISP_C(0) => CG,
            FINISH => LED16_R,
            INPUT => LED16_B,
            START => LED16_G,
            MODE => SW15
        );    
    
    DP <= '1';
    
    LED17_R <= SW15;
    LED17_G <= not(SW15);

end Behavioral;
