// Testbench for storage elements

module testbench();
	
	reg clk, D;
	reg set_n, preset_n, clear_n, reset_n;
	wire Q_sync, Q_async;

	d_ff_async uut1(
		.D(D),
		.clk(clk),
		.reset_n(reset_n),
		.set_n(set_n),
		.Q(Q_async)
	);

	d_ff_sync uut2(
		.D(D),
		.clk(clk),
		.preset_n(preset_n),
		.clear_n(clear_n),
		.Q(Q_sync)
	);

	localparam T = 20;		// clock period
	// clock
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("syn_async.vcd");
		$dumpvars(0, testbench);
		
		D = 1'b1;

		reset_n = 0; clear_n = 0; #(T/3)
		reset_n = 1; clear_n = 1;
		set_n = 0; preset_n = 0; #(T/3)
		set_n = 1; preset_n = 1; #(T/3)

		reset_n = 0; clear_n = 0; #(T/3)
		reset_n = 1; clear_n = 1; 
		set_n = 0; preset_n = 0; #(T/3)
		set_n = 1; preset_n = 1; #(T/3)
		
		reset_n = 0; clear_n = 0; #(T/3)
		reset_n = 1; clear_n = 1; 
		set_n = 0; preset_n = 0; #(T/3)
		set_n = 1; preset_n = 1; #(T/3)
	
		$finish;
	end

endmodule
