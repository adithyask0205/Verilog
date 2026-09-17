// Module for 1-bit NX1 multiplexer

module mux
	#(parameter N = 4)
(
	input [N-1:0]X,
	input [$clog2(N) - 1: 0]S,
	output reg F
);
	integer k;

	always @(*) begin
		F = 'bx;
		for(k = 0; k < N; k = k + 1) begin
			if(k == S) F = X[k];
		end
	end

endmodule
