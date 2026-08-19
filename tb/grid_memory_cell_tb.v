
`timescale 1ns/1ps

module grid_mem_router_tb;
    reg         clk;
    reg         Rst;
    reg         oe;
    reg         endian_swap;
    reg  [1:0]  row_addr;
    reg         col_addr;
    wire [31:0] processing_word;
    wire [7:0]  bus_data;
    reg  [7:0]  tb_drive;
    reg         tb_drive_en;

    assign bus_data = tb_drive_en ? tb_drive : 8'bz;

    grid_mem_router #(.WORD_WIDTH(32)) dut (
        .clk(clk),
        .Rst(Rst),
        .oe(oe),
        .endian_swap(endian_swap),
        .row_addr(row_addr),
        .col_addr(col_addr),
        .processing_word(processing_word),
        .bus_data(bus_data)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("grid_mem_router_tb.vcd");
        $dumpvars(0, grid_mem_router_tb);

        $monitor("Time=%0t, clk=%b, Rst=%b, oe=%b, endian_swap=%b, row_addr=%b, col_addr=%b, processing_word=%h, bus_data=%h",
                 $time, clk, Rst, oe, endian_swap, row_addr, col_addr, processing_word, bus_data);

        dut.fabric_mem[0][0] = 8'h11;
        dut.fabric_mem[1][0] = 8'h22;
        dut.fabric_mem[2][0] = 8'h33;
        dut.fabric_mem[3][0] = 8'h44;
        dut.fabric_mem[0][1] = 8'hAA;
        dut.fabric_mem[1][1] = 8'hBB;
        dut.fabric_mem[2][1] = 8'hCC;
        dut.fabric_mem[3][1] = 8'hDD;

        tb_drive_en = 0; tb_drive = 8'h00;
        oe = 0; endian_swap = 0; row_addr = 0; col_addr = 0;

        Rst = 1;
        #3;
        Rst = 0;
        #10;

        endian_swap = 0;
        @(posedge clk); #1;
        $display("--- endian_swap=0: expect processing_word = 44332211 ---");

        endian_swap = 1;
        @(posedge clk); #1;
        $display("--- endian_swap=1: expect processing_word = 11223344 ---");

        row_addr = 2; col_addr = 1;
        oe = 1;
        #10;
        $display("--- row_addr=2, col_addr=1: expect bus_data = CC ---");

        oe = 0;
        #10;
        $display("--- oe=0: expect bus_data = Z ---");

        Rst = 1;
        #10;
        $display("--- Rst=1: expect processing_word = 0 ---");
        Rst = 0;
        #10;

        $finish;
    end
endmodule
