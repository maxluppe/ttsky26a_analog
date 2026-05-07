module NAND_Comparator_NAND02 ( CLK, VinP, VinM, OutP, OutM ) ;

    input CLK ;
    input VinP ;
    input VinM ;
    output OutP ;
    output OutM ;

    wire C, D, A, B, E, F, CLKn, CLKb;

	sky130_fd_sc_hd__clkbuf_1 ix01 (.X(CLKb), .A(CLK));
	sky130_fd_sc_hd__clkinv_1 ix02 (.Y(CLKn), .A(CLK));

    sky130_fd_sc_hd__nand2_1 ix25 (.Y (OutM), .A (D), .B (OutP)) ;
    sky130_fd_sc_hd__nand2_1 ix31 (.Y (OutP), .A (C), .B (OutM)) ;

    sky130_fd_sc_hd__nand2_1 ix108 (.Y (A), .A (CLKb), .B (VinP)) ;
    sky130_fd_sc_hd__nand2_1 ix21 (.Y (C), .A (E), .B (A)) ;
    sky130_fd_sc_hd__nand2_1 ix11 (.Y (F), .A (CLKn), .B (C)) ;
    sky130_fd_sc_hd__nand2_1 ix5 (.Y (B), .A (CLKb), .B (VinM)) ;
    sky130_fd_sc_hd__nand2_1 ix112 (.Y (D), .A (F), .B (B)) ;
    sky130_fd_sc_hd__nand2_1 ix110 (.Y (E), .A (CLKn), .B (D)) ;
	
endmodule

module NAND_Comparator_AO22 ( CLK, VinP, VinM, OutP, OutM ) ;

    input CLK ;
    input VinP ;
    input VinM ;
    output OutP ;
    output OutM ;

    wire C, D, CLKn, CLKb;

	sky130_fd_sc_hd__clkbuf_1 ix01 (.X(CLKb), .A(CLK));
	sky130_fd_sc_hd__clkinv_1 ix02 (.Y(CLKn), .A(CLK));

    sky130_fd_sc_hd__nand2_1 ix25 (.Y (OutM), .A (D), .B (OutP)) ;
    sky130_fd_sc_hd__nand2_1 ix31 (.Y (OutP), .A (C), .B (OutM)) ;

    sky130_fd_sc_hd__a22o_1 ix21 (.X (C), .B1 (CLKb), .B2 (VinP), .A1 (CLKn), .A2 (D)) ;
    sky130_fd_sc_hd__a22o_1 ix108 (.X (D), .B1 (CLKb), .B2 (VinM), .A1 (CLKn), .A2 (C)) ;

endmodule

module NAND_Comparator_MUX21_NI ( CLK, VinP, VinM, OutP, OutM ) ;

    input CLK ;
    input VinP ;
    input VinM ;
    output OutP ;
    output OutM ;

    wire C, D, CLKb;

	sky130_fd_sc_hd__clkbuf_1 ix01 (.X(CLKb), .A(CLK));


    sky130_fd_sc_hd__nand2_1 ix25 (.Y (OutM), .A (D), .B (OutP)) ;
    sky130_fd_sc_hd__nand2_1 ix31 (.Y (OutP), .A (C), .B (OutM)) ;

    sky130_fd_sc_hd__mux2_1 ix21 (.X (C), .A0 (D), .A1 (VinP), .S (CLKb)) ;
    sky130_fd_sc_hd__mux2_1 ix107 (.X (D), .A0 (C), .A1 (VinM), .S (CLKb)) ;

endmodule

module Comparator_OAI211 ( CLK, VinP, VinM, OutP, OutM ) ;

    input CLK ;
    input VinP ;
    input VinM ;
    output OutP ;
    output OutM ;

    wire C, D, CLKn, CLKb;

	sky130_fd_sc_hd__clkbuf_1 ix01 (.X(CLKb), .A(CLK));
	sky130_fd_sc_hd__clkinv_1 ix02 (.Y(CLKn), .A(CLK));

    sky130_fd_sc_hd__o211ai_1 ix21 (.Y (C), .B1 (CLKb), .C1 (D), .A1 (CLKn), .A2 (VinP)) ;
    sky130_fd_sc_hd__o211ai_1 ix108 (.Y (D), .B1 (CLKb), .C1 (C), .A1 (CLKn), .A2 (VinM)) ;

    sky130_fd_sc_hd__nand2_1 ix25 (.Y (C), .A (D), .B (CLKb)) ;
    sky130_fd_sc_hd__nand2_1 ix31 (.Y (D), .A (C), .B (CLKb)) ;

    sky130_fd_sc_hd__nand2_1 ix26 (.Y (OutM), .A (D), .B (OutP)) ;
    sky130_fd_sc_hd__nand2_1 ix32 (.Y (OutP), .A (C), .B (OutM)) ;

endmodule

module Comparator_DIGOTA ( VinP, VinM, Out ) ;

    input VinP ;
    input VinM ;
    output Out ;

    wire INn, INp, Op, On, EN, not_EN, CMP;

	sky130_fd_sc_hd__inv_1		iv1 (.Y(INn), .A(VinP));
	sky130_fd_sc_hd__inv_1		iv2 (.Y(INn), .A(CMP));
	sky130_fd_sc_hd__inv_1		iv3 (.Y(INp), .A(VinM));
	sky130_fd_sc_hd__inv_1		iv4 (.Y(INp), .A(CMP));

	sky130_fd_sc_hd__inv_1		iv5 (.Y(Op), .A(INn));
	sky130_fd_sc_hd__inv_1		iv6 (.Y(On), .A(INp));

    sky130_fd_sc_hd__xor2_1		ix1 (.X (EN), .A (Op), .B (On)) ;

 	sky130_fd_sc_hd__inv_1		iv7 (.Y(not_EN), .A(EN));
	sky130_fd_sc_hd__einvp_1	it1 (.Z(CMP), .A(Op), .TE(not_EN));

	sky130_fd_sc_hd__ebufn_1	bt1 (.Z(Out), .A(Op), .TE_B(not_EN));

endmodule

module Digital_Analog_Comparator (
	CLK_COMP,
	VinP, VinM,
	VoutP_NAND, VoutM_NAND,
	VoutP_AO22, VoutM_AO22,
	VoutP_MX21, VoutM_MX21,
	VoutP_OAI211, VoutM_OAI211,
	Vout_DIGOTA
	) ;

	input CLK_COMP;
	input VinP, VinM;
	output VoutP_NAND, VoutM_NAND;
	output VoutP_AO22, VoutM_AO22;
	output VoutP_MX21, VoutM_MX21;
	output VoutP_OAI211, VoutM_OAI211;
	output Vout_DIGOTA;
	
	(* keep_hierarchy = "yes" *) NAND_Comparator_NAND02 Comp1a (
		.CLK(CLK_COMP),
		.VinP(VinP),
		.VinM(VinM),
		.OutP(VoutP_NAND),
		.OutM(VoutM_NAND)
	) ;
	
	(* keep_hierarchy = "yes" *) NAND_Comparator_AO22 Comp2 (
		.CLK(CLK_COMP),
		.VinP(VinP),
		.VinM(VinM),
		.OutP(VoutP_AO22),
		.OutM(VoutM_AO22)
	) ;

	(* keep_hierarchy = "yes" *) NAND_Comparator_MUX21_NI Comp5 (
		.CLK(CLK_COMP),
		.VinP(VinP),
		.VinM(VinM),
		.OutP(VoutP_MX21),
		.OutM(VoutM_MX21)
	) ;
	
	(* keep_hierarchy = "yes" *) Comparator_OAI211 Comp6 (
		.CLK(CLK_COMP),
		.VinP(VinP),
		.VinM(VinM),
		.OutP(VoutP_OAI211),
		.OutM(VoutM_OAI211)
	) ;
	
	(* keep_hierarchy = "yes" *) Comparator_DIGOTA Comp7 (
		.VinP(VinP),
		.VinM(VinM),
		.Out(Vout_DIGOTA)
	) ;

endmodule
