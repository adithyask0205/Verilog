// Delayed Debouncer

module debouncer_delayed (
	input clk, reset_n,
	input noisy,
	output debounced
);
	wire timer_done, timer_reset;

	debouncer_delayed_fsm DB (
		.clk(clk),
		.reset_n(reset_n),
		.timer_done(timer_done),
		.noisy(noisy),
		.timer_reset(timer_reset),
		.debounced(debounced)
	);

	// 20ms Timer
	timer_param #(.T(1_999_999)) T0 (
		.clk(clk),
		.reset_n(~timer_reset),
		.enable(~timer_reset),
		.done(timer_done)
	);
endmodule
