// Testbench for Memory Swapper
`timescale 1ns/1ps

module testbench();
	
	parameter ADDR_WIDTH = 7, DATA_WIDTH = 8;

	reg clk, reset_n, we, swap;
	reg [ADDR_WIDTH-1 : 0] addr_w, addr_r, A, B;
	reg [DATA_WIDTH-1 : 0] data_w, data_r;

	integer i;

	mem_swapper #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) uut1(
		.clk(clk),
		.reset_n(reset_n),
		.we(we),
		.swap(swap),
		.addr_w(addr_w),
		.addr_r(addr_r),
		.A(A),
		.B(B),
		.data_w(data_w),
		.data_r(data_r)
	);

	// Clock
	localparam T = 20;
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("swapper.vcd");
		$dumpvars(0, testbench);

		$dumpvars(1, uut1.REGFILE.memory[19]);
		$dumpvars(1, uut1.REGFILE.memory[20]);
		$dumpvars(1, uut1.REGFILE.memory[21]);
		$dumpvars(1, uut1.REGFILE.memory[25]);
		$dumpvars(1, uut1.REGFILE.memory[26]);
		$dumpvars(1, uut1.REGFILE.memory[27]);

		reset_n = 'b0;
		#2
		swap = 'b0;
		reset_n = 'b1;

		// assigning values at locations 20 thru' 30
		for(i = 20; i < 30; i = i + 1) begin
			@(negedge clk)
			we = 'b1;
			addr_w = i;
			data_w = i;
		end
		
		// Swapping locations 22 and 25
		@(negedge clk)
		swap = 'b1;
		A = 'd22;
		B = 'd25;
		
		repeat(3) @(negedge clk);

		swap = 'b0;

		$finish;
	end
endmodule
