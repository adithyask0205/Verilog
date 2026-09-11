// Adder-Subtractor (n bit)

module add_sub
	#(parameter n = 8)
	(
	input [n-1:0] A, B1,
	input a_s,
	output [n-1:0] S,
	output Co,
	output overflow
);
	// Inverting B if Subtraction
	wire [n-1:0]B;
	assign B = B1 ^ {n{a_s}};

	rca #(.n(n)) uut
		(
			.A(A),
			.B(B),
			.Ci(a_s),
			.S(S),
			.Co(Co)
	);

	assign overflow = (A[n-1] ^ B1[n-1] ^ a_s) & (S[n-1] ^ A[n-1]);
endmodule
