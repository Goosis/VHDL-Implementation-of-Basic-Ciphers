// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Apr 20 23:58:29 2024
// Host        : a02-519a running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/Spagetik/Desktop/project_1/project_1.sim/sim_1/impl/timing/xsim/tb_display_mux_time_impl.v
// Design      : display_mux
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a50ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "eab72025" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module display_mux
   (sel,
    en,
    dis_0,
    dis_1,
    dis_2,
    dis_3,
    dis_4,
    dis_5,
    dis_6,
    dis_7);
  input [2:0]sel;
  input en;
  output dis_0;
  output dis_1;
  output dis_2;
  output dis_3;
  output dis_4;
  output dis_5;
  output dis_6;
  output dis_7;

  wire dis_0;
  wire dis_1;
  wire dis_2;
  wire dis_3;
  wire dis_4;
  wire dis_5;
  wire dis_6;
  wire dis_7;
  wire dis_7_OBUF;
  wire en;
  wire en_IBUF;

initial begin
 $sdf_annotate("tb_display_mux_time_impl.sdf",,,,"tool_control");
end
  OBUF dis_0_OBUF_inst
       (.I(1'b1),
        .O(dis_0));
  OBUF dis_1_OBUF_inst
       (.I(1'b1),
        .O(dis_1));
  OBUF dis_2_OBUF_inst
       (.I(1'b1),
        .O(dis_2));
  OBUF dis_3_OBUF_inst
       (.I(1'b1),
        .O(dis_3));
  OBUF dis_4_OBUF_inst
       (.I(1'b1),
        .O(dis_4));
  OBUF dis_5_OBUF_inst
       (.I(1'b1),
        .O(dis_5));
  OBUF dis_6_OBUF_inst
       (.I(1'b1),
        .O(dis_6));
  OBUF dis_7_OBUF_inst
       (.I(dis_7_OBUF),
        .O(dis_7));
  LUT1 #(
    .INIT(2'h1)) 
    dis_7_OBUF_inst_i_1
       (.I0(en_IBUF),
        .O(dis_7_OBUF));
  IBUF en_IBUF_inst
       (.I(en),
        .O(en_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
