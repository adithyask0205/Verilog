// Up-Down-Load COunter

module udl #(parameter N = 4)
(
	input clk,
	input reset_n, enable, load, up,
	input [N-1:0] I,
	output [N-1:0] Q
);
	reg [N-1:0] Q_next, Q_reg;

	// FF Logic
	always @(posedge clk, negedge reset_n) begin
		if(!reset_n)
			Q_reg <= 'b0;
		else if(enable)
			Q_reg <= Q_next;
		else
			Q_reg <= Q_reg;
	end

	// Next State Logic
	always @(*) begin
		case ({load, up})
			2'b00: Q_next = Q_reg - 1;
			2'b01: Q_next = Q_reg + 1;
			2'b1x: Q_next = I;
			default: Q_next = Q_reg;
		endcase
	end
	
	// Output Logic
	assign Q = Q_reg;
endmodule
