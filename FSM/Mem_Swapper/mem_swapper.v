// Memory Swapper

module mem_swapper #(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8) (
	input clk, reset_n, we,
	input [ADDR_WIDTH-1:0] addr_w, addr_r, A, B,
	input [DATA_WIDTH-1:0] data_w,
	input [DATA_WIDTH-1:0] data_r,
	input swap
);
	wire [1:0] sel;
	wire w;
	wire [ADDR_WIDTH - 1: 0]mux_r, mux_w;

	// Register File
	reg_file #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) REGFILE (
		.clk(clk),
		.we(w ? 1'b1 : we),
		.addr_w(mux_w),
		.addr_r(mux_r),
		.data_w(w ? data_r : data_w),
		.data_r(data_r)
	);

	// MUX Write
	mux #(.N(ADDR_WIDTH)) MUX_W (
		.w0(addr_w),
		.w1(7'b0),
		.w2(A),
		.w3(B),
		.sel(sel),
		.Y(mux_w)
	);

	// MUX Read
	mux #(.N(ADDR_WIDTH)) MUX_R (
		.w0(addr_r),
		.w1(A),
		.w2(B),
		.w3(7'b0),
		.sel(sel),
		.Y(mux_r)
	);

	// Swapper FSM
	mem_swapper_fsm FSM (
		.clk(clk),
		.reset_n(reset_n),
		.swap(swap),
		.w(w),
		.select(sel)
	);
endmodule
