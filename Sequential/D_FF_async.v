// Asynchronous D Flip-Flop

module d_ff_reset(
	input clk, D,
	input reset_n, // async
	input set_n
	output Q
);
	reg Q_reg, Q_next;

	// Sequential Segment
	always @(posedge clk, negedge reset_n, negedge set_n) begin
		if(!reset_n)
			Q_reg <= 1'b0;
		else if(!set_n)
			Q_reg <= 1'b1;
		else
			Q_reg <= Q_next;
	end

	// Combinational Segment
	always @(D) begin
		Q_next = D;
	end

	// The combinational segment continuously assigns the value of D to
	// Q_next as D changes, and the sequential segment only assigns that
	// value to Q_reg synchronous to the clock cycle
	assign Q = Q_reg;
endmodule
