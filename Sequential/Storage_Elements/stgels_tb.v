// Testbench for storage elements

module testbench();
	
	reg clk, D;
	wire Q_latch, Q_neg, Q_pos;

	stgels uut1(
		.D(D),
		.clk(clk),
		.Q_latch(Q_latch),
		.Q_neg(Q_neg),
		.Q_pos(Q_pos)
	);

	localparam T = 20;		// clock period
	// clock
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("stgels.vcd");
		$dumpvars(0, testbench);
		
		D = 1'b0; #(2*T)
		D = 1'b1; #(2*T)

		@(posedge clk);			
		D = 1'b0; #2
		D = 1'b1; #3
		D = 1'b0; #4
		D = 1'b1; #4

		@(negedge clk);			
		D = 1'b0; #2
		D = 1'b1; #3
		D = 1'b0; #4
		D = 1'b1; #4
		
		$finish;
	end

endmodule
