`timescale 1ns/1ps

module testbench();
	parameter N = 4;
	reg [N-1:0]I;
	reg en;
	wire [$clog2(N)-1:0]Y;

	pr_enc #(.N(N)) uut1 (
		.I(I),
		.en(en),
		.Y(Y)
	);

	initial begin
		$dumpfile("priority_encoder.vcd");
		$dumpvars(0, testbench);
		
		en = 0;

		I = 4'b0001;	#5
		I = 4'b0010;	#5
		I = 4'b1000;	#5
		I = 4'b1001;	#5

		en = 1;

		I = 4'b0001;	#5
		I = 4'b0010;	#5
		I = 4'b1000;	#5
		I = 4'b1001;	#5
		
		$finish;
	end
endmodule
