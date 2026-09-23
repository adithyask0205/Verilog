// 4x1 N-Bit MUX

module mux #(parameter N = 4) (
	input [N-1:0] w0, w1, w2, w3,
	input [1:0] sel,
	output reg [N-1:0] Y
);

	always @(*) begin
		Y = 'bx;
		case(sel)
			2'b00: Y = w0;
			2'b01: Y = w1;
			2'b10: Y = w2;
			2'b11: Y = w3;
		endcase
	end	
endmodule
