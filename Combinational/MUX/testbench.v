`timescale 1ns/1ps

module testbench();
	
	parameter N = 6;
	reg [N-1:0]X;
	reg [$clog2(N)-1:0]S;
	wire F;

	mux #(.N(N)) uut1 (
		.X(X),
		.S(S),
		.F(F)
	);

	initial begin
		$dumpfile("mux.vcd");
		$dumpvars(0, testbench);

		X = 6'b101001; S = 000; #5
		X = 6'b101001; S = 001; #5
		X = 6'b101001; S = 010; #5
		X = 6'b101001; S = 011; #5
		X = 6'b101001; S = 100; #5
		X = 6'b101001; S = 101; #5
		X = 6'b101001; S = 110; #5
		X = 6'b101001; S = 111; #5

		$finish;
	end	
endmodule
