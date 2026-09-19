// Universal Shift Register

module usr
	#(parameter N = 4)
(
	input clk, reset_n,
	input [1:0] s,
	input MSB_in, LSB_in,
	input [N-1:0] I,
	output [N-1:0] Q
);
	reg [N-1:0] Q_reg, Q_next;

	always @(posedge clk, negedge reset_n) begin
		if(!reset_n)
			Q_reg <= 'b0;
		else
			Q_reg <= Q_next;
	end

	// Defining Functionality or Next State Logic
	always @(*) begin
		case (s)
			2'b00: Q_next = Q_reg;
			2'b01: Q_next = {MSB_in, Q_reg[N-1:1]};
			2'b10: Q_next = {Q_reg[N-2:0], LSB_in};
			2'b11: Q_next = I;
			default Q_next = Q_reg;
		endcase
	end

	assign Q = Q_reg;

endmodule
