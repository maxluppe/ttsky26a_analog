/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module ttsky26a_analog (
//    input  wire       VGND,
//    input  wire       VDPWR,    // 1.8v power supply
//    input  wire       VAPWR,    // 3.3v power supply
//    input  wire [7:0] ui_in,    // Dedicated inputs
    input  wire cntrl,    // Dedicated inputs
//    output wire [7:0] uo_out,   // Dedicated outputs
    output wire VoutP_NAND, output wire VoutM_NAND,
    output wire VoutP_AO22, output wire VoutM_AO22,
    output wire VoutP_MX21, output wire VoutM_MX21,
    output wire VoutP_OAI211, output wire VoutM_OAI211,
    output wire Vout_DIGOTA,

//    input  wire [7:0] uio_in,   // IOs: Input path
//    output wire [7:0] uio_out,  // IOs: Output path
//    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [1:0] ua,       // Analog pins, only ua[5:0] can be used
//    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
//    input  wire       clk,      // clock
//    input  wire       rst_n     // reset_n - low to reset
);

    // All output pins must be assigned. If not used, assign to 0.
    //assign uio_out = 0;
    //assign uio_oe  = 0;
    
    // List all unused inputs to prevent warnings
    //wire _unused = &{ena, clk, ui_in[7:1], 1'b0};

    (* keep_hierarchy = "yes" *) Digital_Analog_Comparator u0 (
        .CLK_COMP(cntrl),//clk),
        .VinP(ua[0]),
        .VinM(ua[1]),
        .VoutP_NAND(VoutP_NAND), .VoutM_NAND(VoutM_NAND),
        .VoutP_AO22(VoutP_AO22), .VoutM_AO22(VoutM_AO22),
        .VoutP_MX21(VoutP_MX21), .VoutM_MX21(VoutM_MX21),
        .VoutP_OAI211(VoutP_OAI211), .VoutM_OAI211(VoutM_OAI211),
		.Vout_DIGOTA(Vout_DIGOTA)
  );

endmodule
