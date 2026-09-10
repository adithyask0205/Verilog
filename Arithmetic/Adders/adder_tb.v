`timescale 1ns/1ps

module adder_tb;

	reg A, B;
	wire S, Co;

	adder uut(.A(A), .B(B), .S(S), .Co(Co));

	initial begin
		$dumpfile("half_adder.vcd");
		$dumpvars(0, adder_tb);
		
		A = 0; B = 0; #10
		A = 0; B = 1; #10
		A = 1; B = 0; #10
		A = 1; B = 1; #10
		
		$finish;
	end
endmodule
