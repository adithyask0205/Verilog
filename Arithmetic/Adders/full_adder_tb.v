`timescale 1ns/1ps

module full_adder_tb;

	reg A, B, Ci;
	wire S, Co;

	full_adder uut(
		.A(A), .B(B), .Ci(Ci),
		.S(S), .Co(Co)
	);
	
	initial begin
		$dumpfile("full_adder.vcd");
		$dumpvars(0, full_adder_tb);

		A = 0; B = 0; Ci = 0; #10
		A = 0; B = 0; Ci = 1; #10
		A = 0; B = 1; Ci = 0; #10
		A = 0; B = 1; Ci = 1; #10
		A = 1; B = 0; Ci = 0; #10
		A = 1; B = 0; Ci = 1; #10
		A = 1; B = 1; Ci = 0; #10
		A = 1; B = 1; Ci = 1; #10
		
		$finish;
	end
endmodule
