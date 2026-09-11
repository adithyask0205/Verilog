// Ripple-Carry Adder (n bit)

module rca
	#(parameter n = 8)
	(
	input [n-1:0] A, B,
	input Ci,
	output [n-1:0] S,
	output Co
);
	// Carry variables
	wire [n:0] c;
	assign c[0] = Ci;

	generate
		genvar k;
		// Instantiating FA for each n bit
		for (k = 0; k < n; k = k+1)
		begin
			fa FA (
				.A(A[k]),
				.B(B[k]),
				.Ci(c[k]),
				.S(S[k]),
				.Co(c[k+1])	// Final element would be the final carry
			);	
		end
	endgenerate
	
	assign Co = c[n];

endmodule
