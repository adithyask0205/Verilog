// Testbench for Register

module testbench();
	parameter N = 4;
	reg clk, load;
	reg [N-1:0]I;
	wire [N-1:0]Q;

	register #(.N(N)) uut1(
		.clk(clk),
		.load(load),
		.I(I),
		.Q(Q)
	);

	localparam T = 20; // clock period

	always begin
		clk = 1'b0; #(T/2)
		clk = 1'b1; #(T/2);
	end

	initial begin
		$dumpfile("reg.vcd");
		$dumpvars(0, testbench);
		
		I = 4'b1011; load = 1'b1; #(T);
		I = 4'b1100; load = 1'b0; #(T);
		I = 4'b0110; load = 1'b1; #(T);
		I = 4'b1001; load = 1'b0; #(T);
		I = 4'b1111; load = 1'b1; #(T);

		$finish;
	end
endmodule
