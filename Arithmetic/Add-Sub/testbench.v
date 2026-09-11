// Testbench for adder-subtractor
`timescale 1ns/1ps

module tb;
	
	reg [7:0] A, B;
	reg a_s;
	wire [7:0] S;
	wire Co;

	add_sub uut(
		.A(A),
		.B1(B),
		.a_s(a_s),
		.S(S),
		.Co(Co)
	);
	
	initial begin
		$dumpfile("adder_sub.vcd");
		$dumpvars(0, tb);

		$display("~ADD/SUB|\t\tA\t|\t\tB\t|\tCo\t|\tS");
		$display("-------------------------------------------------------------------------------------------------------");

		A = 8'b01011010; B = 8'b00011010; a_s = 1'b0; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);

		A = 8'b01011010; B = 8'b00011010; a_s = 1'b1; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);

		$display("-------------------------------------------------------------------------------------------------------");
		
		A = 8'b01010000; B = 8'b01101010; a_s = 1'b0; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);

		A = 8'b01010000; B = 8'b01101010; a_s = 1'b1; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);
		
		$display("-------------------------------------------------------------------------------------------------------");

		A = 8'b01011011; B = 8'b00011001; a_s = 1'b0; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);
		
		A = 8'b01011011; B = 8'b00011001; a_s = 1'b1; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);

		$display("-------------------------------------------------------------------------------------------------------");

		A = 8'b01001001; B = 8'b10111010; a_s = 1'b0; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);						

		A = 8'b01001001; B = 8'b10111010; a_s = 1'b1; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", a_s, A, B, Co, S);

		$display("-------------------------------------------------------------------------------------------------------");

		$finish;
	end
endmodule
