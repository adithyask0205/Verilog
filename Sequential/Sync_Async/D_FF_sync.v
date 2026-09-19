// Synchronous D Flip-Flop

module d_ff_sync (
	input clk,  D,
	input clear_n,
	input preset_n,
	output Q
);	
	reg Q_reg, Q_next;
	
	// Sequential Segment
	always @(posedge clk) begin
		Q_reg <= Q_next;
	end
	
	// Combinational Segment
	always @(D, clear_n, preset_n) begin
		if (!clear_n)
			Q_next = 1'b0;
		else if (!preset_n)
			Q_next = 1'b1;
		else
			Q_next = D;
	end

	assign Q = Q_reg;
endmodule
