// Module for 2n x n Priority Encoder

module pr_enc
	#(parameter N = 4)
(
	input [N-1:0]I,
	input en,
	output reg [$clog2(N)-1:0]Y
);
	integer k;

	always @(I, en) begin
		Y = 'bx;
		if (en)
			for(k = 0; k < N; k = k + 1) begin
				if(I[k])
					Y = k;				
			end
	end
endmodule

