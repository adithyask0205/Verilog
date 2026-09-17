// Module for 1-bit half adder

module ha (
	input A, B,
	output reg S, C_out
);
	always @(A, B) begin
		S = A ^ B;	// S = A XOR B
		C_out = A & B;	// Carry = A AND B
	end
endmodule
