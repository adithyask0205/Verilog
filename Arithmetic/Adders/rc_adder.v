// Ripple-Carry Adder

module rc_adder(
	input [3:0] A, B,
	input Ci,
	output [3:0] S,
	output Co
);
	wire c1, c2, c3;	
	full_adder uut1(
		.A(A[0]), .B(B[0]), .Ci(Ci), .S(S[0]), .Co(c1)
	);

	full_adder uut2(
		.A(A[1]), .B(B[1]), .Ci(c1), .S(S[1]), .Co(c2)
	);

	full_adder uut3(
		.A(A[2]), .B(B[2]), .Ci(c2), .S(S[2]), .Co(c3)
	);

	full_adder uut4(
		.A(A[3]), .B(B[3]), .Ci(c3), .S(S[3]), .Co(Co)
	);

endmodule
