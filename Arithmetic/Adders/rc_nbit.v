module rc_nbit
	#(parameter n = 8)
	(
	input [n-1:0] A, B,
	input Ci,
	output [n-1:0] S,
	output Co
);
	wire [n:0] c;
	assign c[0] = Ci;

	generate
		genvar k;
		for(k=0; k<n; k=k+1)
		begin
			full_adder FA (
				.A(A[k]),
				.B(B[k]),
				.Ci(c[k]),
				.S(S[k]),
				.Co(c[k+1])
			);
		end
	endgenerate

	assign Co = c[n];
endmodule
