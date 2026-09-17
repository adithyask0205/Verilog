// Module for 2x1 MUX 

module mux_2x1(
	input A, B,
	input S,
	output F
);
	assign F = S ? B : A;	// F = B if S == 1, else F = A (i.e., @ S = 0)
endmodule
