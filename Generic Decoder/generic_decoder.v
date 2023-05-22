`timescale 1ns/1ps

module generic_decoder(
	#(parameter N = 3)(
	input [N-1:0] w,
	input en,
	output reg [0:2**N-1] y
	);

	always@(w,en)
	begin
		y = 'b0;

		if(en)
			y[w] = 1'b1;
		else
			y[w] = 'b0;
	end
endmodule
