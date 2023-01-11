module stopwatch(
    input        CLK, SW0, SW1, SW2,
    output [7:0] LED,
    output [0:6] seg0, seg1, seg2, seg3, seg4, seg5
);

wire [2:0] STATE;
wire [7:0] MS, S, M, OUT_MS, OUT_S, OUT_M;
wire [3:0] ms1, ms2, s1, s2, m1, m2;
wire DET0, DET1, DET2, MSCLK;

CLK_DIV T_CLK         (.MCLK(CLK), .MSCLK(MSCLK));
EDGE_DET T_EdgeDector (.sw0(SW0), .sw1(SW1), .sw2(SW2), .mclk(CLK), .det0(DET0), .det1(DET1), .det2(DET2));
moore_machine TMM     (.clk(CLK), .sw0(DET0), .sw1(DET1), .sw2(DET2), .state(STATE));

timer timer     (.msclk(MSCLK), .state(STATE), .ms(MS), .s(S), .m(M));
output_sel outs (.mclk(CLK), .state(STATE), .ms(MS), .s(S), .m(M), .out_ms(OUT_MS), .out_s(OUT_S), .out_m(OUT_M));

seg_div     T_msD (.val(OUT_MS), .out1(ms1), .out2(ms2));
seg_div     T_sD  (.val(OUT_S), .out1(s1), .out2(s2));
seg_div     T_mD  (.val(OUT_M), .out1(m1), .out2(m2));

seg7_dec    T_SEG4 (.val(ms1), .seg(seg4));
seg7_dec    T_SEG5 (.val(ms2), .seg(seg5));
seg7_dec    T_SEG2 (.val(s1), .seg(seg2));
seg7_dec    T_SEG3 (.val(s2), .seg(seg3));
seg7_dec    T_SEG0 (.val(m1), .seg(seg0));
seg7_dec    T_SEG1 (.val(m2), .seg(seg1));

LED_blink T_LED  (.mclk(MSCLK), .state(STATE), .LED(LED));

endmodule
