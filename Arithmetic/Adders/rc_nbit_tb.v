`timescale 1ns/1ps

module rc_nbit_tb;
	
	reg [7:0] A, B;
	reg Ci;
	wire [7:0] S;
	wire Co;
	
	rc_nbit uut(
		.A(A),
		.B(B),
		.Ci(Ci),
		.S(S),
		.Co(Co)
	);	

	initial begin
		$dumpfile("rc_nbit.vcd");
		$dumpvars(0, rc_nbit_tb);
		
		$display("\tA\t|\t\tB\t|\tCi\t|\tCo\t|\tS");

		A = 8'b01011010; B = 8'b00011010; Ci = 1'b1; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, Ci, Co, S);
		
		A = 8'b00111110; B = 8'b01010110; Ci = 1'b1; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, Ci, Co, S);
		
		A = 8'b01010000; B = 8'b01101010; Ci = 1'b0; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, Ci, Co, S);
		
		A = 8'b01011011; B = 8'b00011001; Ci = 1'b0; #10	
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, Ci, Co, S);
		
		A = 8'b01001001; B = 8'b10111010; Ci = 1'b0; #10
		$display("%b\t|\t%b\t|\t%b\t|\t%b\t|\t%b", A, B, Ci, Co, S);
		
		$finish;
	end
endmodule
