`timescale 1ns/1ps

module bin2sevenseg_tb;
    reg  [3:0] bin_in;
    wire [6:0] seg_out;

    reg [6:0] expected [0:15];

    bin2sevenseg dut (.bin_in(bin_in), .seg_out(seg_out));

    integer i;
    initial begin
        expected[0]=7'h3F; expected[1]=7'h06; expected[2]=7'h5B; expected[3]=7'h4F;
        expected[4]=7'h66; expected[5]=7'h6D; expected[6]=7'h7D; expected[7]=7'h07;
        expected[8]=7'h7F; expected[9]=7'h6F; expected[10]=7'h77; expected[11]=7'h7C;
        expected[12]=7'h39; expected[13]=7'h5E; expected[14]=7'h79; expected[15]=7'h71;

        for (i = 0; i < 16; i = i + 1) begin
            bin_in = i;
            #10;
            if (seg_out !== expected[i])
                $display("FAIL: bin_in=%h seg_out=%h expected=%h", bin_in, seg_out, expected[i]);
            else
                $display("PASS: bin_in=%h -> seg_out=%h", bin_in, seg_out);
        end
        $finish;
    end
endmodule