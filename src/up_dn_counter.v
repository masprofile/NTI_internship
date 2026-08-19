module up_dn_counter (
    input             clk,
    input             rst,
    input             load_enable,
    input             enable,
    input             up,
    input  reg    [8:0]  load_value,
    output reg [8:0]  count
);

always @(posedge clk) begin

    if (!rst)
        count <= 9'b0;

    else if (load_enable)
        count <= load_value;

    else if (enable) begin

        if (up)
            count <= count + 1'b1;

        else
            count <= count - 1'b1;

    end

    else
        count <= count;

end

endmodule