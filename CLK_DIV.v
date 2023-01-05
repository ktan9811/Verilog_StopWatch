module CLK_DIV(input MCLK, output reg MSCLK = 13'd1);
	reg [12:0] cnt = 13'd0;
	always@(posedge MCLK) begin
		
		if(cnt != 13'd5000) cnt <= cnt + 1;
		else begin
			cnt <= 0;
			MSCLK <= ~ MSCLK;
		end
	end
endmodule