-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.4.2024 20:52:09 UTC

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all; -- Definition of "to_unsigned"

entity tb_bin_to_symb is
end tb_bin_to_symb;

architecture tb of tb_bin_to_symb is

    component bin_to_symb
        port (bin_in       : in std_logic_vector (4 downto 0);
              clear        : in std_logic;
              seg_data_out : out std_logic_vector (6 downto 0);
              clk          : in std_logic);
    end component;

    signal sig_bin_in       : std_logic_vector (4 downto 0);
    signal sig_clear        : std_logic;
    signal sig_seg_data_out : std_logic_vector (6 downto 0);
    signal sig_clk          : std_logic;

    constant TbPeriod : time := 5 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : bin_to_symb
    port map (bin_in       => sig_bin_in,
              clear        => sig_clear,
              seg_data_out => sig_seg_data_out,
              clk          => sig_clk);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    sig_clk <= TbClock;

    p_stimulus : process is
    begin

        report "Stimulus process started";

        -- Normal operation
        sig_clear <= '0';
        sig_bin_in   <= "11111";
        wait for 5 ns;

        -- Clear display
        sig_clear <= '1';
        wait for 15 ns;
        sig_clear <= '0';
        wait for 5 ns;

        -- Loop for all hex values
        for i in 0 to 31 loop

            -- Convert decimal value `i` to 5-bit wide binary
            sig_bin_in <= std_logic_vector(to_unsigned(i, 5));
            -- sig_bin <= std_logic_vector(to_unsigned(i, sig_bin'length));
            wait for 50 ns;

            -- Expected segment values
            case sig_bin_in is

                when b"00000" =>
                    assert sig_seg_data_out = "0001000"
                        report "0 does not map to a"
                        severity error;

                when b"00001" =>
                    assert sig_seg_data_out = "1100000"
                        report "1 does not map to b"
                        severity error;

                when b"00010" =>
                    assert sig_seg_data_out = "0110001"
                        report "2 does not map to c"
                        severity error;

                when b"00011" =>
                    assert sig_seg_data_out = "1000010"
                        report "3 does not map to d"
                        severity error;

                when b"00100" =>
                    assert sig_seg_data_out = "0110000"
                        report "4 does not map to e"
                        severity error;

                when b"00101" =>
                    assert sig_seg_data_out = "0111000"
                        report "5 does not map to f"
                        severity error;

                when b"00110" =>
                    assert sig_seg_data_out = "0100001"
                        report "6 does not map to g"
                        severity error;

                when b"00111" =>
                    assert sig_seg_data_out = "1101000"
                        report "7 does not map to h"
                        severity error;

                when b"01000" =>
                    assert sig_seg_data_out = "1001111"
                        report "8 does not map to i"
                        severity error;

                when b"01001" =>
                    assert sig_seg_data_out = "1000111"
                        report "9 does not map to j"
                        severity error;
                when b"01010" =>
                    assert sig_seg_data_out = "0101000"
                        report "10 does not map to k"
                        severity error;
                when b"01011" =>
                    assert sig_seg_data_out = "1110001"
                        report "11 does not map to l"
                        severity error;
                 when b"01100" =>
                    assert sig_seg_data_out = "0101011"
                        report "12 does not map to m"
                        severity error;                                               
                 when b"01101" =>
                    assert sig_seg_data_out = "0001001"
                        report "13 does not map to n"
                        severity error;               
                when b"01110" =>
                    assert sig_seg_data_out = "0000001"
                        report "14 does not map to o"
                        severity error;
                when b"01111" =>
                    assert sig_seg_data_out = "0011000"
                        report "15 does not map to p"
                        severity error;
                when b"10000" =>
                    assert sig_seg_data_out = "0001100"
                        report "16 does not map to q"
                        severity error;
                when b"10001" =>
                    assert sig_seg_data_out = "0011001"
                        report "17 does not map to r"
                        severity error;  
                when b"10010" =>
                    assert sig_seg_data_out = "0100100"
                        report "18 does not map to s"
                        severity error;
                 when b"10011" =>
                    assert sig_seg_data_out = "1110000"
                        report "19 does not map to t"
                        severity error;
                 when b"10100" =>
                    assert sig_seg_data_out = "1000001"
                        report "20 does not map to u"
                        severity error;
                when b"10101" =>
                    assert sig_seg_data_out = "1000101"
                        report "21 does not map to v"
                        severity error;
                when b"10110" =>
                    assert sig_seg_data_out = "1010101"
                        report "22 does not map to w"
                        severity error;
                when b"10111" =>
                    assert sig_seg_data_out = "1001000"
                        report "23 does not map to x"
                        severity error;   
                when b"11000" =>
                    assert sig_seg_data_out = "1000100"
                        report "24 does not map to y"
                        severity error;  
                when b"11001" =>
                    assert sig_seg_data_out = "0010110"
                        report "25 does not map to z"
                        severity error;                                                                     
                when others =>
                    null;  -- No assertion for other input combinations

            end case;

        end loop;

        report "Stimulus process finished";
        wait;

    end process p_stimulus;
end tb;