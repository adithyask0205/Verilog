// Testbench to verify the Arithmetic Unit

`timescale 1ns/1ps

module testbench();
	parameter N = 4;	// defining the number of bits in each number
	reg [N-1:0] A, B;	// numbers undergoing the operation
	reg a_s;
	wire [N-1:0] S;		// sum result
	wire C_out;		// Carry

	au #(.N(N)) uut (	// Calling the rca module while also defining the parameter
		.A(A),
		.B(B),
		.a_s(a_s),
		.S(S),
		.C_out(C_out)
	);
	
	// SImulation begins
	initial begin
		$dumpfile("arithmetic.vcd");
		$dumpvars(0, testbench);
		
		$display("-----------------------------------------------------------------------------------");
		
		$display("A\t|\tB\t|\ta_s\t|\tC_out\t|\tS");

		$display("-----------------------------------------------------------------------------------");
		
		A = 4'b0010; B = 4'b0101; a_s = 1; #5 $display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, a_s, C_out, S); 

		$display("-----------------------------------------------------------------------------------");

		A = 4'b1000; B = 4'b0001; a_s = 1; #5 $display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, a_s, C_out, S); 

		$display("-----------------------------------------------------------------------------------");

		A = 4'b0011; B = 4'b1101; a_s = 1; #5 $display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, a_s, C_out, S); 

		$display("-----------------------------------------------------------------------------------");

		A = 4'b0110; B = 4'b0111; a_s = 0; #5 $display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, a_s, C_out, S); 

		$display("-----------------------------------------------------------------------------------");

		$finish;
	end
endmodule


