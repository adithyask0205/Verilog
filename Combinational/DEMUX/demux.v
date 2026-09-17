// Module for 1xN DEMUX

module demux
	#(parameter N = 4)
(
	input X,
	input [$clog2(N)-1:0]S,
	output reg [N-1:0]F
);
	integer k;	
	always @(*) begin
		F = 'b0;
		for(k = 0; k < N; k = k + 1) begin
			if(k == S) F[k] = X;
		end
	end
endmodule
