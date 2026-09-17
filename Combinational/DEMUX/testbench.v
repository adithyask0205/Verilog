`timescale 1ns/1ps

module testbench();
	
	parameter N = 6;
	reg X;
	reg [$clog2(N)-1:0]S;
	wire [N-1:0]F;

	demux #(.N(N)) uut1 (
		.X(X),
		.S(S),
		.F(F)
	);

	initial begin
		$dumpfile("demux.vcd");
		$dumpvars(0, testbench);

		X = 1'b1; S = 000; #5
		X = 1'b1; S = 001; #5
		X = 1'b1; S = 010; #5
		X = 1'b1; S = 011; #5
		X = 1'b1; S = 100; #5
		X = 1'b1; S = 101; #5
		X = 1'b1; S = 110; #5
		X = 1'b1; S = 111; #5

		$finish;
	end	
endmodule
