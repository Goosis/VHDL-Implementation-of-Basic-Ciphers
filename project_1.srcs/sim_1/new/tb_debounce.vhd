library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_debounce is
end entity tb_debounce;

architecture behavior of tb_debounce is
    -- Component Declaration for the Device Under Test (DUT)
    component debounce is
        port (
            clk      : in    std_logic;
            rst      : in    std_logic;
            en       : in    std_logic;
            bouncey  : in    std_logic;
            clean    : out   std_logic;
            pos_edge : out   std_logic;
            neg_edge : out   std_logic
        );
    end component;

    -- Inputs
    signal sig_clock     : std_logic;
    signal sig_reset     : std_logic;
    signal sig_clock_en  : std_logic;
    signal sig_button_in : std_logic;
    -- Output
    signal sig_pulse_out : std_logic;
    signal sig_pos_edge  : std_logic;
    signal sig_neg_edge  : std_logic;

    -- Clock period definitions
    constant TbPeriod   : time      := 10 ns;
    signal   TbClock    : std_logic := '0';
    signal   TbSimEnded : std_logic := '0';
begin

    -- Instantiate the Device Under Test (DUT)
    dut : component debounce
        port map (
            clk      => sig_clock,
            rst      => sig_reset,
            en       => sig_clock_en,
            bouncey  => sig_button_in,
            clean    => sig_pulse_out,
            pos_edge => sig_pos_edge,
            neg_edge => sig_neg_edge
        );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod / 2 when TbSimEnded /= '1' else
               '0';

    -- EDIT: Check that clk is really your main clock signal
    sig_clock <= TbClock;

    -- Stimulus process
    stim_proc : process is
    begin

        sig_clock_en  <= '1';
        sig_button_in <= '0';
        sig_reset     <= '1';
        wait for TbPeriod * 3;
        sig_reset     <= '0';

        -- first activity
        wait for TbPeriod * 10;
        sig_button_in <= '1';
        wait for TbPeriod * 2;
        sig_button_in <= '0';
        wait for TbPeriod * 1;
        sig_button_in <= '1';
        wait for TbPeriod * 1;
        sig_button_in <= '0';
        wait for TbPeriod * 15;

        -- second activity
        sig_button_in <= '1';
        wait for TbPeriod * 1;
        sig_button_in <= '0';
        wait for TbPeriod * 1;
        sig_button_in <= '1';
        wait for TbPeriod * 1;
        sig_button_in <= '0';
        wait for TbPeriod * 2;
        sig_button_in <= '1';
        wait for TbPeriod * 20;
        sig_button_in <= '0';
        wait for TbPeriod * 1;
        sig_button_in <= '1';
        wait for TbPeriod * 20;

        -- third activity
        sig_button_in <= '0';
        wait for TbPeriod * 2;
        sig_button_in <= '1';
        wait for TbPeriod * 1;
        sig_button_in <= '0';
        wait for TbPeriod * 1;
        sig_button_in <= '1';
        wait for TbPeriod * 1;
        sig_button_in <= '0';
        wait for TbPeriod * 50;

        -- forth activity
        sig_clock_en  <= '0';
        wait for TbPeriod * 5;
        sig_button_in <= '1';
        wait for TbPeriod * 2;
        sig_button_in <= '0';
        wait for TbPeriod * 1;
        sig_button_in <= '1';
        wait for TbPeriod * 1;
        sig_button_in <= '0';
        wait for TbPeriod * 50;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;

    end process stim_proc;

end architecture behavior;