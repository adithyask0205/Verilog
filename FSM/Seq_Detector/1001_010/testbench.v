// Testbench for 1001 & 010 sequence detector
`timescale 1ns/1ps

module testbench();
	reg clk, reset_n;
	reg x;
	wire y;
	
	melay uut1(
		.clk(clk),
		.reset_n(reset_n),
		.x(x),
		.y(y)
	);

	localparam T = 20;
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("sim.vcd");
		$dumpvars(0, testbench);
		
		reset_n = 1'b0;
		x = 1'b0;
		@(negedge clk);
		reset_n = 1'b1;

		#T x = 1'b1;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b0;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b0;
		#T x = 1'b1;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b1;
	
		$finish;
	end
endmodule
