`timescale 1ns/1ps

module rc_tb;
	
	reg [3:0]A, B;
	reg Ci;
	wire [3:0]S;
	wire Co;

	rc_adder uut(
		.A(A), .B(B), .Ci(Ci), .S(S), .Co(Co)
	); 
	
	initial begin
		$dumpfile("rc_adder.vcd");
		$dumpvars(0, rc_tb);
		
		A = 4'b1011; B = 4'b0011; Ci = 1'b1; #10
		$display("%b\t%b\t%b\t%b\t%b", A, B, Ci, Co, S);		
		
		A = 4'b0011; B = 4'b0101; Ci = 1'b1; #10
		$display("%b\t%b\t%b\t%b\t%b", A, B, Ci, Co, S);		
		
		A = 4'b0001; B = 4'b1001; Ci = 1'b1; #10
		$display("%b\t%b\t%b\t%b\t%b", A, B, Ci, Co, S);			

		$finish;
	end
endmodule
