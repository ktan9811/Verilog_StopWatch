module output_sel (
		  input  mclk,
        input  [1:0] state,
        input  [7:0] ms, s, m,
        output wire [7:0] out_ms, out_s, out_m
);

reg  [7:0] lp_ms = 8'b0, lp_s = 8'b0, lp_m = 8'b0;

assign out_ms = ((state==2'd2) ? lp_ms : ms);
assign out_s  = ((state==2'd2) ? lp_s : s);
assign out_m  = ((state==2'd2) ? lp_m : m);

always @(posedge mclk)
begin
	if(state == 2'd1) begin
		lp_ms <= ms;
		lp_s <= s;
		lp_m <= m;
	end
end

endmodule

