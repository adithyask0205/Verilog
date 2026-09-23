// Debouncer FSM

module debouncer_delayed_fsm(
	input clk, reset_n,
	input timer_done, noisy,
	output timer_reset, debounced
);
	reg [1:0] state_reg, state_next;
	parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;

	// Sequential Stage
	always @(posedge clk, negedge reset_n) begin
		if (!reset_n)
			state_reg <= 0;
		else
			state_reg <= state_next;
	end

	// Next State Logic
	always @(*) begin
		state_next = state_reg;
		case(state_reg)
			s0 : state_next = noisy ? s1 : s0;
			s1 : state_next = noisy ? (timer_done ? s2 : s1) : s0;
			s2 : state_next = noisy ? s2 : s3;
			s3 : state_next = noisy ? s2 : (timer_done ? s1 : s3);
			default: state_next = s0;
		endcase
	end


	// Output Logic
	assign timer_reset = (state_reg == s2) | (state_reg == s0);
	assign debounced = (state_reg == s2) | (state_reg == s3);
endmodule
