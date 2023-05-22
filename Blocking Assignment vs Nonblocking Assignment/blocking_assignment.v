`timescale 1ns/1ps

module blocking_assignment(
	input a,b,c,
	output reg x
);

	always@(a,b,c)
	begin
		x = a;		// first, this line is compiled so, x = a
		x = x ^ b;	// second, this line is compiled so, x = a ^ b
		x = x | c;	// last, this line is compiled so, x = (a ^ b) | c
	end
endmodule

// At the end of always block, the logic circuit is synthesized as (a ^ b) | c
