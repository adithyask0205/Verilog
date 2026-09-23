// Parameterized Timer

module timer_param #(parameter T = 255) (
	input clk, reset_n, enable,
	output done
);
	localparam BITS = $clog2(T);

	reg [BITS-1 : 0] Q_reg, Q_next;

	always @(posedge clk, negedge reset_n) begin
		if (~reset_n)
			Q_reg <= 0;
		else if (enable)
			Q_reg <= Q_next;
		else
			Q_reg <= Q_reg;
	end
	
	assign done = (Q_reg == T);

	always @(*) begin
		Q_next = done ? 'b0 : Q_reg + 1;
	end

endmodule
