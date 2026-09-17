// Module for n-bit Ripple-Carry Adder

module rca 
	#(parameter N = 4)
	(
	input [N-1:0] A, B,
	input C_in,
	output [N-1:0] S,
	output C_out
);
	wire [N:0] c;
	assign c[0] = C_in;

	generate
		genvar k;
		for(k = 0; k < N; k = k + 1) begin
			fa FA (
				.P (A[k]),
				.Q (B[k]),
				.R (c[k]),
				.Y (S[k]),
				.C_out (c[k+1])
			);
		end
	endgenerate

	assign C_out = c[N];
endmodule
