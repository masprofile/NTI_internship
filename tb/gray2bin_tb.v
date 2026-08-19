`timescale 1ns/1ps

module gray2bin_tb;
    reg  [3:0] gray_in;
    wire [3:0] bin_out;
    reg [3:0] expected [0:15];

    gray2bin dut (.gray_in(gray_in), .bin_out(bin_out));

    integer i;
    initial begin
        expected[0]=0;  expected[1]=1;  expected[2]=3;  expected[3]=2;
        expected[4]=7;  expected[5]=6;  expected[6]=4;  expected[7]=5;
        expected[8]=15; expected[9]=14; expected[10]=12; expected[11]=13;
        expected[12]=8; expected[13]=9; expected[14]=11; expected[15]=10;

        for (i = 0; i < 16; i = i + 1) begin
            gray_in = i;
            #10;
            if (bin_out !== expected[i])
                $display("FAIL: gray_in=%b bin_out=%b expected=%b", gray_in, bin_out, expected[i]);
            else
                $display("PASS: gray_in=%b -> bin_out=%b", gray_in, bin_out);
        end
        $finish;
    end
endmodule