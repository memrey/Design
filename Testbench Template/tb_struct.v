`timescale 1ns/1ps

module <tb_name>_tb();

	// 1) Declare local reg and wire identifiers. For inputs of UUT use reg, for outputs of UUT use wire.

	reg <clock>;
	reg <input_1>;
		.
		.
	reg <input_n>;

	wire <output_1>;
		.
		.
	wire <output_n>;

	// 2) Instantiate the module under test

	<uut_name> <any_name> (
		.<clock>(<clock>),
		.<input_1>(<input_1>),
			.
			.
		.<input_n>(<input_n>),
		.<output_1>(<output_1>),
			.
			.
		.<output_n>(<output_n>)
	);

	// 3) Specify a stopwatch to stop the simulation

	initial
	begin
		#40 $finish;
	end

	// 4) Generate stimuli, using initial and always. For combinational circuits initial is enough, for sequential circuits use always.

	initial
	begin
		clock = 1'b0;
		forever
		begin
			#5 clock = ~clock; // An example of 100 MHz clock generation
		end
	end

	initial
	begin
		<input_1> = 1'b0;
			.
			.
		<input_n> = 4'd5;

		#10
		<input_1> = 1'b0;
			.
			.
		<input_n> = 4'd5;

		#15
		<input_1> = 1'b0;
			.
			.
		<input_n> = 4'd5;
	end

	// 5) Display the output response

	initial
	begin
		$monitor("time = %d: <input_1> = %b \t <input_n> = %d \n", $time, <input_1>, <input_n>);
	end

endmodule
