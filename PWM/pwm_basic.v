`timescale 1ns/1ps

module pwm_basic
	#(parameter R=8)(
	input clk, rst_n,
	input [R-1:0] duty, // duty is parametric. It will be calculated really as duty_cycle * (2**R)
	output pwm_out
	);

	reg [R-1:0] Q_curr, Q_next;
	
	// Register part
	always@(posedge clk, negedge rst_n)
	begin
		if(~rst_n)
			Q_curr <= 'b0;
		else
			Q_curr <= Q_next;
	end

	// Next state logic part
	always@(*)
	begin
		Q_next = Q_curr + 1;
	end
	
	// Output logic part
	assign pwm_out <= (Q_curr < duty);

endmodule
