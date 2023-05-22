`timescale 1ns/1ps

module nonblocking_assignment(
	input a,b,c,
	output reg x
);

	always@(a,b,c)
	begin
		x <= a;		// this line is compiled, x = a
		x <= x ^ b;	// this line overrides the first line so, x = x ^ b. x is the original value at the start of always block
		x <= x | c;	// this line overrides the second line so, x = x | c. x is the original value at the start of always block
	end
endmodule

// At the end of always block, the logic circuit is synthesized as x = x | c which is a feedback. A feedback shouldn't exist in a combinational circuit.
// So nonblocking assignments shouldn't be used in combinational circuits.
