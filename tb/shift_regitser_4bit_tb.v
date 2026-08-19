`timescale 1ns/1ps

module shift_register_4bit_tb;

    reg clk;
    reg reset_in;
    wire [3:0] shift_out;

    // Instantiate the module
    shift_register_4bit DUT (
        .clk(clk),
        .reset_in(reset_in),
        .shift_out(shift_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // VCD waveform
    initial begin
        $dumpfile("shift_register_4bit.vcd");
        $dumpvars(0, shift_register_4bit_tb);
    end

    // Test
    initial begin
        reset_in = 0;

        #10;
        reset_in = 1;

        #40;

        reset_in = 0;
        #10;

        reset_in = 1;
        #20;

        $finish;
    end

    // Display values in terminal
    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | shift_out = %b",
                 $time, clk, reset_in, shift_out);
    end

endmodule