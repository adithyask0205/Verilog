// Module for T Flip-Flop

module T_ff(
	input clk,
	input T, reset_n,
	output Q
);
	localparam delay = 2;	// to simulate delay

	reg Q_reg, Q_next;

	always @(posedge clk, negedge reset_n) begin
		if(!reset_n)
			Q_reg <= 'b0;
		else
			Q_reg <= Q_next;
	end

	// Next State Logic
	always @(*) begin
		Q_next = T ? ~Q_reg : Q_reg;
	end
	
	assign Q = Q_reg;
endmodule
