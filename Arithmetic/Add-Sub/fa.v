//Full Adder

module fa(
	input A, B, Ci,
	output S, Co
);
	wire s1, c1, c2;
	
	// First Half-Adder
	ha uut1(
		.A(A),
		.B(B),
		.S(s1),
		.Co(c1)
	);

	// Second Half-Adder
	ha uut2(
		.A(s1),
		.B(Ci),
		.S(S),
		.Co(c2)
	);

	// Final Carry
	assign Co = c1 | c2;
endmodule
