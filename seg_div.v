module seg_div(
    input       [7:0]val,
    output  reg [3:0]out1, out2
);

always @(*)begin
    if (val > 7'd9)begin
        out1 <= val / 10;
        out2 <= val % 10;
    end
    else begin
        out1 <= 0;
        out2 <= val;
    end
end
endmodule