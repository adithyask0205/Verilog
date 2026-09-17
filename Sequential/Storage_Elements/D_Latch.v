// Module for D-Latch

module D_Latch(
	input D, clk,
	output reg Q,
	output Q_b
);
	assign Q_b = ~Q;

	always @(D, clk) begin
		if(clk) Q <= D;
		else Q <= Q;
	end
endmodule
