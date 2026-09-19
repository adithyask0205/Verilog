// Up Counter

module up
	 #(parameter N = 4)
(
	input clk, reset_n,
	output [N-1:0] Q
);
	generate
		genvar k;
		for(k = 0; k < N; k = k + 1) begin
			T_ff TFF (
				.clk(k == 0 ? clk : ~Q[k-1]),	// Only first FF has clock as clock input, the remaining ones take preceeding outputs for clock
				.reset_n(reset_n),
				.T(1'b1),
				.Q(Q[k])
			);
		end
	endgenerate
endmodule
	//T_ff TFF1 (
	//	.clk(clk),
	//	.T(1'b1),
	//	.reset_n(reset_n),
	//	.Q(Q[0])
	//);
	 
	//T_ff TFF2 (
	//	.clk(Q[0]),
	//	.T(1'b1),
	//	.reset_n(reset_n),
	//	.Q(Q[1])
	//);
	 
	//T_ff TFF3 (
	//	.clk(Q[1]),
	//	.T(1'b1),
	//	.reset_n(reset_n),
	//	.Q(Q[2])
	//);
	 
	//T_ff TFF4 (
	//	.clk(Q[2]),
	//	.T(1'b1),
	//	.reset_n(reset_n),
	//	.Q(Q[3])
	//);
