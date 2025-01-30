// Copyright (c) 2025 Sigma Logic
`default_nettype none

module simple_pll #(
    parameter string RefClkMhz = "70",
    parameter int IDivSel = 1,
    parameter int MDivSel = 25,
    parameter int ODiv0Sel = 8,
    parameter int ODiv1Sel = 8,
    parameter int ODiv2Sel = 8,
    parameter int ODiv3Sel = 8,
    parameter bit Clk0En = 1,
    parameter bit Clk1En = 0,
    parameter bit Clk2En = 0,
    parameter bit Clk3En = 0
) (
`ifdef SIMPLE_PLL_RESET
    input  logic rst,
`endif
`ifdef SIMPLE_PLL_LOCK
    output logic lock,
`endif
`ifdef SIMPLE_PLL_CLK_0
    output logic out_clk_0,
`endif
`ifdef SIMPLE_PLL_CLK_1
    output logic out_clk_1,
`endif
`ifdef SIMPLE_PLL_CLK_2
    output logic out_clk_2,
`endif
`ifdef SIMPLE_PLL_CLK_3
    output logic out_clk_3,
`endif
    input  logic ref_clk
);

    logic gw_vcc;
    logic gw_gnd;

    assign gw_vcc = 1'b1;
    assign gw_gnd = 1'b0;

    logic [8:0] sink;

    PLL #(
        .FCLKIN(RefClkMhz),
        .IDIV_SEL(IDivSel),
        .FBDIV_SEL(1),
        .ODIV0_SEL(ODiv0Sel),
        .ODIV1_SEL(ODiv1Sel),
        .ODIV2_SEL(ODiv2Sel),
        .ODIV3_SEL(ODiv3Sel),
        .ODIV4_SEL(8),
        .ODIV5_SEL(8),
        .ODIV6_SEL(8),
        .MDIV_SEL(25),
        .MDIV_FRAC_SEL(0),
        .ODIV0_FRAC_SEL(0),
        .CLKOUT0_EN(Clk0En ? "TRUE" : "FALSE"),
        .CLKOUT1_EN(Clk1En ? "TRUE" : "FALSE"),
        .CLKOUT2_EN(Clk2En ? "TRUE" : "FALSE"),
        .CLKOUT3_EN(Clk3En ? "TRUE" : "FALSE"),
        .CLKOUT4_EN("FALSE"),
        .CLKOUT5_EN("FALSE"),
        .CLKOUT6_EN("FALSE"),
        .CLKFB_SEL("INTERNAL"),
        .CLKOUT0_DT_DIR(1'b1),
        .CLKOUT1_DT_DIR(1'b1),
        .CLKOUT2_DT_DIR(1'b1),
        .CLKOUT3_DT_DIR(1'b1),
        .CLKOUT0_DT_STEP(0),
        .CLKOUT1_DT_STEP(0),
        .CLKOUT2_DT_STEP(0),
        .CLKOUT3_DT_STEP(0),
        .CLK0_IN_SEL(1'b0),
        .CLK0_OUT_SEL(1'b0),
        .CLK1_IN_SEL(1'b0),
        .CLK1_OUT_SEL(1'b0),
        .CLK2_IN_SEL(1'b0),
        .CLK2_OUT_SEL(1'b0),
        .CLK3_IN_SEL(1'b0),
        .CLK3_OUT_SEL(1'b0),
        .CLK4_IN_SEL(2'b00),
        .CLK4_OUT_SEL(1'b0),
        .CLK5_IN_SEL(1'b0),
        .CLK5_OUT_SEL(1'b0),
        .CLK6_IN_SEL(1'b0),
        .CLK6_OUT_SEL(1'b0),
        .DYN_DPA_EN("FALSE"),
        .CLKOUT0_PE_COARSE(0),
        .CLKOUT0_PE_FINE(0),
        .CLKOUT1_PE_COARSE(0),
        .CLKOUT1_PE_FINE(0),
        .CLKOUT2_PE_COARSE(0),
        .CLKOUT2_PE_FINE(0),
        .CLKOUT3_PE_COARSE(0),
        .CLKOUT3_PE_FINE(0),
        .CLKOUT4_PE_COARSE(0),
        .CLKOUT4_PE_FINE(0),
        .CLKOUT5_PE_COARSE(0),
        .CLKOUT5_PE_FINE(0),
        .CLKOUT6_PE_COARSE(0),
        .CLKOUT6_PE_FINE(0),
        .DYN_PE0_SEL("FALSE"),
        .DYN_PE1_SEL("FALSE"),
        .DYN_PE2_SEL("FALSE"),
        .DYN_PE3_SEL("FALSE"),
        .DYN_PE4_SEL("FALSE"),
        .DYN_PE5_SEL("FALSE"),
        .DYN_PE6_SEL("FALSE"),
        .DE0_EN("FALSE"),
        .DE1_EN("FALSE"),
        .DE2_EN("FALSE"),
        .DE3_EN("FALSE"),
        .DE4_EN("FALSE"),
        .DE5_EN("FALSE"),
        .DE6_EN("FALSE"),
        .RESET_I_EN("FALSE"),
        .RESET_O_EN("FALSE"),
        .ICP_SEL(6'bXXXXXX),
        .LPF_RES(3'bXXX),
        .LPF_CAP(2'b00),
        .SSC_EN("FALSE"),
        .DYN_IDIV_SEL("FALSE"),
        .DYN_FBDIV_SEL("FALSE"),
        .DYN_MDIV_SEL("FALSE"),
        .DYN_ODIV0_SEL("FALSE"),
        .DYN_ODIV1_SEL("FALSE"),
        .DYN_ODIV2_SEL("FALSE"),
        .DYN_ODIV3_SEL("FALSE"),
        .DYN_ODIV4_SEL("FALSE"),
        .DYN_ODIV5_SEL("FALSE"),
        .DYN_ODIV6_SEL("FALSE"),
        .DYN_DT0_SEL("FALSE"),
        .DYN_DT1_SEL("FALSE"),
        .DYN_DT2_SEL("FALSE"),
        .DYN_DT3_SEL("FALSE"),
        .DYN_ICP_SEL("FALSE"),
        .DYN_LPF_SEL("FALSE")
    ) u_pll (
`ifdef SIMPLE_PLL_LOCK
        .LOCK(lock)
`else
        .LOCK(sink[0]),
`endif
`ifdef SIMPLE_PLL_CLK_0
        .CLKOUT0(out_clk_0)
`else
        .CLKOUT0(sink[1]),
`endif
`ifdef SIMPLE_PLL_CLK_1
        .CLKOUT1(out_clk_1)
`else
        .CLKOUT1(sink[2]),
`endif
`ifdef SIMPLE_PLL_CLK_2
        .CLKOUT2(out_clk_1)
`else
        .CLKOUT2(sink[3]),
`endif
`ifdef SIMPLE_PLL_CLK_3
        .CLKOUT3(out_clk_1)
`else
        .CLKOUT3(sink[4]),
`endif
        .CLKOUT4(sink[5]),
        .CLKOUT5(sink[6]),
        .CLKOUT6(sink[7]),
        .CLKFBOUT(sink[8]),
        .CLKIN(ref_clk),
        .CLKFB(gw_gnd),
`ifdef SIMPLE_PLL_RESET
        .RESET(rst)
`else
        .RESET(1'b0)
`endif,
        .PLLPWD(gw_gnd),
        .RESET_I(gw_gnd),
        .RESET_O(gw_gnd),
        .FBDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .IDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .MDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .MDSEL_FRAC({gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL0({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL0_FRAC({gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL1({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL2({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL3({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL4({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL5({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .ODSEL6({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .DT0({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .DT1({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .DT2({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .DT3({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .ICPSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .LPFRES({gw_gnd, gw_gnd, gw_gnd}),
        .LPFCAP({gw_gnd, gw_gnd}),
        .PSSEL({gw_gnd, gw_gnd, gw_gnd}),
        .PSDIR(gw_gnd),
        .PSPULSE(gw_gnd),
        .ENCLK0(gw_vcc),
        .ENCLK1(gw_vcc),
        .ENCLK2(gw_vcc),
        .ENCLK3(gw_vcc),
        .ENCLK4(gw_vcc),
        .ENCLK5(gw_vcc),
        .ENCLK6(gw_vcc),
        .SSCPOL(gw_gnd),
        .SSCON(gw_gnd),
        .SSCMDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
        .SSCMDSEL_FRAC({gw_gnd, gw_gnd, gw_gnd})
    );

endmodule : simple_pll
