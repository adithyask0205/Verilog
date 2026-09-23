// Register

module reg_file #(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8)
(
	input clk,
	input we,
	input [ADDR_WIDTH - 1: 0] addr_w, addr_r,
	input [DATA_WIDTH - 1: 0] data_w,
	output [DATA_WIDTH - 1: 0] data_r
);

	reg [DATA_WIDTH - 1:0] memory [0 : 2**ADDR_WIDTH - 1];

	// Writing into memory
	always @(posedge clk) begin
		if(we)
			memory[addr_w] <= data_w;
	end

	// Reading from memory
	assign data_r = memory[addr_r];

endmodule
