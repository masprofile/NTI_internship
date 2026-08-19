`timescale 1ns/1ps

module up_dn_counter_tb;

reg clk;
reg rst;
reg enable;
reg load_enable;
reg up;
reg [8:0] load_value;

wire [8:0] count;

up_dn_counter uut (
    .clk(clk),
    .rst(rst),
    .load_enable(load_enable),
    .enable(enable),
    .up(up),
    .load_value(load_value),
    .count(count)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("up_dn_counter.vcd");
    $dumpvars(0, up_dn_counter_tb);

    clk = 0;
    rst = 0;
    load_enable = 0;
    enable = 0;
    up = 1;
    load_value = 9'b0;

    // Release reset
    #10;
    rst = 1;

    // Enable count up
    #10;
    enable = 1;
    up = 1;

    #50;

    // Disable counter
    enable = 0;

    // Load 100
    #10;
    load_value = 9'd100;
    load_enable = 1;

    #10;
    load_enable = 0;

    // Count up from 100
    enable = 1;
    up = 1;

    #40;

    // Count down
    up = 0;

    #50;

    // Disable counter
    enable = 0;

    #20;

    // Reset again
    rst = 0;

    #10;

    rst = 1;

    #20;

    $finish;

end

initial begin

    $monitor("Time = %0t | rst = %b | load_enable = %b | enable = %b | up = %b | load_value = %d | count = %d",
             $time, rst, load_enable, enable, up, load_value, count);

end

endmodule