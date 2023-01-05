module moore_machine(
    input   wire        clk, sw0, sw1, sw2,
    input   wire        ms, s, m,
    output  reg [2:0]   y,
    output  reg [1:0]   state = 3'b000
);


//S0 = STOP
//S1 = RUN

localparam [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

always @ (posedge clk)
begin
    case(state)
        S0:begin
            if (sw0 == 2'b1) begin
                state <= S1;
            end
        end
        S1:begin
            if (sw0 == 2'b1) begin
                state <= S3;
            end
            else if (sw2 == 2'b1) begin
                state <= S2;
            end
        end
        S2:begin
            if (sw2 == 2'b1) begin
                state <= S1;
            end
        end
        S3:begin
            if (sw0 == 2'b1) begin
                state <= S1;
            end
            else if (sw1 == 2'b1) begin
                state <= S0;
            end
        end
        default : state <= S0;
    endcase
end
endmodule
