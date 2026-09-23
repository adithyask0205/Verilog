// Memory Swapper FSM

module mem_swapper_fsm (
	input clk, reset_n, swap,
	output w,
	output [1:0] select
);
	reg [1:0] state_next, state_reg;
	parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;

	// State Assignment
	always @(posedge clk) begin
		if (!reset_n)
			state_reg <= 'b0;
		else
			state_reg <= state_next;
	end

	// Next State Logic
	always @(*) begin
		case(state_reg)
			s0: state_next = swap ? s1 : s0;
			s1: state_next = s2;
			s2: state_next = s3;
			s3: state_next = s0;
		endcase
	end

	// Output Logic
	assign w = swap;
	assign select = state_reg;
endmodule
