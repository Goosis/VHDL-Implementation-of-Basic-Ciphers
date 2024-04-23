-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 20.4.2024 21:38:55 UTC

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_display_mux is
end tb_display_mux;

architecture tb of tb_display_mux is

    component display_mux
        port (sel   : in std_logic_vector (2 downto 0);
              en    : in std_logic;
              dis_0 : out std_logic;
              dis_1 : out std_logic;
              dis_2 : out std_logic;
              dis_3 : out std_logic;
              dis_4 : out std_logic;
              dis_5 : out std_logic;
              dis_6 : out std_logic;
              dis_7 : out std_logic);
    end component;

    signal sel   : std_logic_vector (2 downto 0);
    signal en    : std_logic;
    signal dis_0 : std_logic;
    signal dis_1 : std_logic;
    signal dis_2 : std_logic;
    signal dis_3 : std_logic;
    signal dis_4 : std_logic;
    signal dis_5 : std_logic;
    signal dis_6 : std_logic;
    signal dis_7 : std_logic;

begin

    dut : display_mux
    port map (sel   => sel,
              en    => en,
              dis_0 => dis_0,
              dis_1 => dis_1,
              dis_2 => dis_2,
              dis_3 => dis_3,
              dis_4 => dis_4,
              dis_5 => dis_5,
              dis_6 => dis_6,
              dis_7 => dis_7);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sel <= (others => '0');
        en <= '0';
        wait for 50 ns;
        en <= '1';
        for i in 0 to 7 loop
            sel <= std_logic_vector(TO_UNSIGNED(i, 3));
            wait for 50 ns;
            case sel is
                when b"000" =>
                    assert dis_0 = '0'
                        report "000 dont sel dis_0"
                        severity error;
                when b"001" =>
                    assert dis_0 = '0'
                        report "001 dont sel dis_1"
                        severity error;
                when b"010" =>
                    assert dis_2 = '0'
                        report "010 dont sel dis_2"
                        severity error;
                when b"011" =>
                    assert dis_3 = '0'
                        report "011 dont sel dis_3"
                        severity error;
                when b"100" =>
                    assert dis_4 = '0'
                        report "100 dont sel dis_4"
                        severity error;
                when b"101" =>
                    assert dis_5 = '0'
                        report "101 dont sel dis_5"
                        severity error;
                when b"110" =>
                    assert dis_6 = '0'
                        report "110 dont sel dis_6"
                        severity error;
                when b"111" =>
                    assert dis_7 = '0'
                        report "111 dont sel dis_7"
                        severity error;
                when others => null;
            end case;
        end loop;
        report "MUX simulation finished";
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

--configuration cfg_tb_display_mux of tb_display_mux is
--    for tb
--    end for;
--end cfg_tb_display_mux;