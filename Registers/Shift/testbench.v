// Testbench for USR

module testbench();
	parameter N = 4;
	
	reg clk, reset_n;
	reg [1:0] s;

	reg MSB_in, LSB_in;
	reg [N-1:0] I;

	wire [N-1:0] Q;

	usr #(.N(N)) uut1 (
		.clk(clk),
		.reset_n(reset_n),
		.MSB_in(MSB_in),
		.LSB_in(LSB_in),
		.s(s),
		.I(I),
		.Q(Q)
	);

	// clock
	localparam T = 20;
	always begin
		clk = 1'b0; #(T/2);
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("usr.vcd");
		$dumpvars(0, testbench);
		
		// Parallel Load
		s = 2'b11;
		I = 4'b0110; #(T)
		
		// Right Shift
		s = 2'b01;
		MSB_in = 1; #(T)
		MSB_in = 0; #(T)
		MSB_in = 1; #(T)
		MSB_in = 1; #(T)
		
		// Left Shift
		s = 2'b10;
		LSB_in = 1; #(T)
		LSB_in = 0; #(T)
		LSB_in = 1; #(T)
		LSB_in = 0; #(T)

		// Hold
		s = 2'b00; #(3*T/4)	// To observe async behaviour of reset_n

		// Reset
		reset_n = 0; #(T)
		reset_n = 1;

		// Hold
		s = 2'b00; #(T/4)

		// Parallel Load
		s = 2'b11;
		I = 4'b1001; #(T)

		$finish;
	end
endmodule
