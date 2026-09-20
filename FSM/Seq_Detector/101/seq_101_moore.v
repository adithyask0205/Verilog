// Sequence Detector for 101 (Moore)

module seq_101_moore (
	input clk, reset_n,
	input x,
	output y
);
	reg [1:0] state_reg, state_next;

	localparam s0 = 2'b00;
	localparam s1 = 2'b01;
	localparam s2 = 2'b10;
	localparam s3 = 2'b11;

	// State Register Logic
	always @(posedge clk, negedge reset_n) begin
		if (!reset_n)
			state_reg <= s0;
		else
			state_reg <= state_next;
	end

	// Next State Logic
	always @(*) begin
		case (state_reg)
			s0: state_next = x ? s1 : s0;
			s1: state_next = x ? s1 : s2;
			s2: state_next = x ? s3 : s0;
			s3: state_next = x ? s1 : s2;
			default: state_next = state_reg;
		endcase
	end

	// Output Logic
	assign y = (state_reg == s3);
endmodule
