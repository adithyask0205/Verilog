// Negitive-edge trigerred D-FF

module D_FF_pos(
	input clk, D,
	output reg Q,
	output Q_b
);
	assign Q_b = ~Q;

	always @(posedge clk) begin
		Q <= D;
	end

endmodule
