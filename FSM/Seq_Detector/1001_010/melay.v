// Sequence Detector for 1001 & 010 (Melay)

module melay (
	input clk, reset_n,
	input x,
	output y
);
	reg [2:0] state_reg, state_next;

	// States
	localparam s0 = 3'b000;
	localparam s1 = 3'b001;
	localparam s2 = 3'b010;
	localparam s3 = 3'b011;
	localparam s4 = 3'b100;
	localparam s5 = 3'b101;

	// State Register
	always @(posedge clk, negedge reset_n) begin
		if (!reset_n)
			state_reg <= s0;
		else
			state_reg <= state_next;
	end

	// Next State Logic
	always @(*) begin
		case (state_reg)
			s0: state_next = x ? s3 : s1;
			s1: state_next = x ? s2 : s1;
			s2: state_next = x ? s3 : s4;
			s3: state_next = x ? s3 : s4;
			s4: state_next = x ? s2 : s5;
			s5: state_next = x ? s2 : s1;
			default: state_next = s0;
		endcase
	end

	// Output Logic
	assign y = ((state_reg == s5) & x) | ((state_reg == s2) & ~x);
endmodule
