module EDGE_DET(input sw0, sw1, sw2, mclk, output det0, det1, det2);
	reg sw0z, sw1z, sw2z;
	reg sw0zz, sw1zz, sw2zz;
	reg sw0_now, sw1_now, sw2_now;
	
	always@(posedge mclk) begin
		sw0_now <= sw0;
		sw1_now <= sw1;
		sw2_now <= sw2;
		
		sw0z <= sw0_now;
		sw1z <= sw1_now;
		sw2z <= sw2_now;
		
		sw0zz <= sw0z;
		sw1zz <= sw1z;
		sw2zz <= sw2z;
	end
	
	assign det0 = sw0zz & ~sw0z;
	assign det1 = sw1zz & ~sw1z;
	assign det2 = sw2zz & ~sw2z;
endmodule