// Module covering all storage elements for simulation

module stgels(
	input clk, D,
	output Q_latch, Q_neg, Q_pos
);
	D_Latch d_l(
		.D(D),
		.clk(clk),
		.Q(Q_latch)
	);

	D_FF_neg d_fn(
		.D(D),
		.clk(clk),
		.Q(Q_neg)
	);

	D_FF_pos d_fp(
		.D(D),
		.clk(clk),
		.Q(Q_pos)
	);

endmodule
