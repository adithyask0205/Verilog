// Negitive-edge trigerred D-FF

module D_FF_neg(
	input clk, D,
	output Q_b,
	output reg Q
);
	assign Q_b = ~Q;

	always @(negedge clk) begin
		Q <= D;
	end

endmodule
