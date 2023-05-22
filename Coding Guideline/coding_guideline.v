// Use blocking assignments(=) for combinational circuits.
// Use non-blocking assignments(<=) for registers(sequential circuits).
// Assign a varible only in a single always block.
// Separate registers into individual code segments.

`timescale 1ns/1ps

module coding_guideline(
	input a,b,c,
	input clk,
	output f,g
);
	reg f_curr, f_next, g_curr, g_next;

	// Register assignments. Sequential circuit
	always@(posedge clk)
	begin
		f_curr <= f_next;
		g_curr <= g_next;
	end

	// Next state logic. Combinational circuit
	always@(a, b, c, g_curr)
	begin
		f_next = a & ~g_curr;
		g_next = b | c;
	end
	
	// Output logic
	assign f = f_curr;
	assign g = g_curr;

endmodule
