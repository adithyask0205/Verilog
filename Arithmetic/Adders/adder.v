module adder(
	input wire A,  B,
	output reg S, Co
);
	always @(A,B) begin
		S = A ^ B;
		Co = A & B;
	end
endmodule
