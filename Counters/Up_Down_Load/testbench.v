//`timescale 1ns/1ps

module testbench();
	parameter N = 5;
	
	reg clk, enable, reset_n, load, up;
	reg [N-1:0]I;
	
	wire [N-1:0]Q;

	localparam T = 20;
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end
	
	udl #(.N(N)) uut1 (
		.clk(clk),
		.reset_n(reset_n),
		.enable(enable),
		.load(load),
		.up(up),
		.I(I),
		.Q(Q)
	);

	initial begin
		$dumpfile("udl.vcd");
		$dumpvars(0, testbench);

		reset_n = 1'b0;
		enable = 1'b0;
		load = 1'b0;
		up = 1'b1;
		#2 reset_n = 1'b1;

		repeat(2) @(negedge clk);
		enable = 1'b1;

		wait (Q == 20)
		enable = 1'b0;

		repeat(2) @(negedge clk);
		up = 1'b0;
		enable = 1'b1;

		repeat(2) @(negedge clk);
		I = 9;
		load = 1'b1;

		@(negedge clk);
		load = 1'b0;

		wait (Q == 2);
		I = 7;
		load = 1'b1;
		
		repeat(2) @(negedge clk);
		load = 1'b0;

		repeat(5) @(negedge clk);
		I = 11;
		up = 1'b1;
		load = 1'b1;

		repeat(2) @(negedge clk);
		load = 1'b0;

		$finish;
	end
endmodule
