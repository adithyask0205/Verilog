// Testbench for 101 sequence detector
`timescale 1ns/1ps

module testbench();
	reg clk, reset_n;
	reg x;
	wire y_melay, y_moore;
	
	seq_101_melay uut1(
		.clk(clk),
		.reset_n(reset_n),
		.x(x),
		.y(y_melay)
	);

	seq_101_moore uut2(
		.clk(clk),
		.reset_n(reset_n),
		.x(x),
		.y(y_moore)
	);

	localparam T = 20;
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("seq_101.vcd");
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
		#T x = 1'b0;
		#T x = 1'b1;
		#T x = 1'b0;
		#T x = 1'b1;
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
