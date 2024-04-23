-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Sat Apr 20 23:55:44 2024
-- Host        : a02-519a running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Spagetik/Desktop/project_1/project_1.sim/sim_1/impl/func/xsim/tb_display_mux_func_impl.vhd
-- Design      : display_mux
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a50ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_mux is
  port (
    sel : in STD_LOGIC_VECTOR ( 2 downto 0 );
    en : in STD_LOGIC;
    dis_0 : out STD_LOGIC;
    dis_1 : out STD_LOGIC;
    dis_2 : out STD_LOGIC;
    dis_3 : out STD_LOGIC;
    dis_4 : out STD_LOGIC;
    dis_5 : out STD_LOGIC;
    dis_6 : out STD_LOGIC;
    dis_7 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of display_mux : entity is true;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ of display_mux : entity is std.standard.true;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ of display_mux : entity is std.standard.true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of display_mux : entity is "eab72025";
end display_mux;

architecture STRUCTURE of display_mux is
  signal dis_7_OBUF : STD_LOGIC;
  signal en_IBUF : STD_LOGIC;
begin
dis_0_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => dis_0
    );
dis_1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => dis_1
    );
dis_2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => dis_2
    );
dis_3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => dis_3
    );
dis_4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => dis_4
    );
dis_5_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => dis_5
    );
dis_6_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => dis_6
    );
dis_7_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => dis_7_OBUF,
      O => dis_7
    );
dis_7_OBUF_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => en_IBUF,
      O => dis_7_OBUF
    );
en_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => en,
      O => en_IBUF
    );
end STRUCTURE;
