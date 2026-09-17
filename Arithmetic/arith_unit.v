// Module for Arithmetic Uni

module au
	#(parameter N = 4)
(
	input [N-1:0] A, B,
	input a_s,		// this will determine whether we perform addition or subtraction on A and B
	output [N-1:0] S,
	output C_out
);
	wire [N-1:0] B_xor;	
	assign B_xor = B ^ {N{a_s}};	// for addition, B_xor = B, and for subtraction, B_xor = ~B

	rca #(.N(N)) RCA (
		.A(A),
		.B(B_xor),
		.C_in(a_s),	// A + B + 0 = A + B <||> A + ~B + 1 = A - B
		.S(S),
		.C_out(C_out)
	);
endmodule
