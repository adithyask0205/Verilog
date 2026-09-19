// Up Counter

module down
	 #(parameter N = 4)
(
	input clk, reset_n,
	output [N-1:0] Q
);
	// Input Chain
	wire [N:0]Q_in;
	assign Q_in[0] = 1'b1;	// Input for the first FF

	generate
		genvar k;
		for(k = 0; k < N; k = k + 1) begin
			T_ff TFF (
				.clk(clk),
				.reset_n(reset_n),
				.T(Q_in[k]),
				.Q(Q[k])
			);
			// Input for next FF = Input for current FF && Output of current FF
			assign Q_in[k+1] = Q_in[k] & ~Q[k];
		end
	endgenerate
endmodule
