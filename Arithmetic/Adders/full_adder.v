module full_adder(
	input wire A, B, Ci,
	output S, Co // changed from reg to wire since reg can only be assigned in always or initial blocks
);
	wire s1, c1, c2;

	adder uut1(
		.A(A), .B(B), .S(s1), .Co(c1)
	);
		
	adder uut2(
		.A(Ci), .B(s1), .S(S), .Co(c2)
	);	// output S is a wire which cannot be assigned to reg S of current module since outside
	
	assign Co = c1 | c2;

endmodule
