module timer (
        input            msclk,
        input wire [1:0] state,
        output reg [7:0] ms = 8'b0, s = 8'b0, m = 8'b0
);


localparam [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

always @(posedge msclk)
begin	 
    //STATE = 0, INITIAL
	if (state == S0) begin
        ms <= 8'd0;
        s <= 8'd0;
        m <= 8'd0;
    end
    
    //STATE = 1 or 2, ms++
    else if(state == S1 || state == S2) begin

        if (ms < 8'd99) ms <= ms + 1;
        else begin
            s <= s + 8'd1;
            ms <= 8'd0;
        end

        if (s > 8'd59) begin
            m <= m + 8'd1;
            s <= 8'd0;
        end

        if (m > 8'd99) begin
            m <= 8'd0;
        end
    end
end

endmodule