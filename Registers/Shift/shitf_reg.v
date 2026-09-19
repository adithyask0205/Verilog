// Shift register

module shift_reg
	#(parameter N = 4)
(
	input clk,
	input SI,
	// output [N-1:0]Q,
	output SO
);
	reg [N-1:0] Q_reg, Q_next;

	always @(posedge clk) begin
		Q_reg <= Q_next;
	end


	// SI -> (Q3, Q2, Q1, Q0) => (SI, Q3, Q2, Q1)	*RS*
	// (Q3, Q2, Q1, Q0) <- SI => (Q2, Q1, Q0, SI)	*LS*

	always @(SI, Q_reg) begin
		// Right Shift
		Q_next = {SI, Q_reg[N-1:1]};

		// Left Shift
		// Q_next = {Q_reg[N-2:0], SI};
	end
	
	assign SO = Q_reg[0];		// Right Shift
	// assign SO = Q_reg[N-1] 	// Left Shift
	// assign Q = Q_reg;		// Entire Sequence
endmodule
