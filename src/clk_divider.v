`timescale 1ns/1ps

module clk_divider #(
    parameter CLK_DIV = 4
)(
    input wire clk_in,
    input wire reset_n,
    output reg clk_out
);

    reg [31:0] counter;

    always @(posedge clk_in or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 0;
            clk_out <= 0;
        end
        else begin
            if (counter == (CLK_DIV/2)-1) begin
                counter <= 0;
                clk_out <= ~clk_out;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end

endmodule