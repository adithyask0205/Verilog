// Testbench for Debouncer FSM
`timescale 1ns/1ps

module testbench ();
 	reg clk, reset_n;
    reg noisy;
    wire debounced;
    integer i;
    
    // Instantiate unit under test
    debouncer_delayed uut(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .debounced(debounced)
    );

    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 20;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    localparam DELAY = 50_000_000;
    
    initial
    begin
		$dumpfile("debouncer.vcd");
		$dumpvars(0, testbench);

        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        noisy = 1'b0;
        #2  
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        noisy = 1'b1;
        
        #(DELAY);
        noisy = 1'b0;
        
        #(DELAY);
        
        repeat(20) @(negedge clk);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2);
        noisy = ~noisy;
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
                    
        #(DELAY/2);
        noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 6; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2) noisy = 1'b0;                                                
        #(DELAY) $stop;
        
		$finish;
    end        
    
    
endmodule
