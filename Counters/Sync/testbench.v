module testbench();
	parameter N = 4;

	reg clk, reset_n;

	wire [N-1:0] Q_up, Q_down;

	up #(.N(N)) uut1 (
		.clk(clk),
		.reset_n(reset_n),
		.Q(Q_up)
	);

	down #(.N(N)) uut2 (
		.clk(clk),
		.reset_n(reset_n),
		.Q(Q_down)
	);

	localparam T = 20;
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("counters.vcd");
		$dumpvars(0, testbench);
		
		reset_n = 0; #T
		reset_n = 1;

		#(10*T);

		$finish;
	end
endmodule
