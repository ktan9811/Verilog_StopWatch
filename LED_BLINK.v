module LED_blink(
	input mclk,
	input [1:0] state,
	output[8:1] LED = 0
);

reg[5:0] cnt;
reg [8:1] LED_REG = 8'b0;

always @ (posedge mclk)begin

if(state == 2'd1 || state == 2'd2) begin
	if(cnt == 6'b110010) begin
		LED_REG = ~LED_REG;
		cnt <= 0;
	end
	else begin
		cnt <= cnt + 1;
	end
end 

end

assign LED = LED_REG;

	
endmodule
