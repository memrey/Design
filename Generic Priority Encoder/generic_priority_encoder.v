`timescale 1ns/1ps

module generic_priority_encoder
	#(parameter N=4)(
	input [N-1:0] w,
	output z,
	output reg [$clog2(N)-1:0] y
);

	assign z = |w; // z = w[3] | w[2] | w[1] | w[0]

	integer k;

	always@(w)
	begin
		y = 'bX; // so that no any latches are inferred
		
		for(k=0; k<N; k=k+1)
			if(w[k])
				y = k;
	end

endmodule
