// Module for n-bit Full Adder using HA module

module fa (
	input P, Q, R,
	output Y, C_out
);
	wire s1, c1, c2;
	ha HA1 (
		.A(P),
		.B(Q),
		.S(s1),
		.C_out(c1)
	);

	ha HA2 (
		.A(R),
		.B(s1),
		.S(Y),
		.C_out(c2)
	);

	assign C_out = c1 | c2;
endmodule
