`timescale 1ns/1ps

module clk_divider_tb;

    reg clk_in;
    reg reset_n;
    wire clk_out;

    clk_divider #(
        .CLK_DIV(4)
    ) uut (
        .clk_in(clk_in),
        .reset_n(reset_n),
        .clk_out(clk_out)
    );

    always #5 clk_in = ~clk_in;

    initial begin

        $dumpfile("clk_divider.vcd");
        $dumpvars(0, clk_divider_tb);

        clk_in = 0;
        reset_n = 0;

        #20;

        reset_n = 1;

        #200;

        $finish;
    end

endmodule