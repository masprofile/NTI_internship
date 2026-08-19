module bin2sevenseg (
    input  wire [3:0] bin_in,
    output reg  [6:0] seg_out   // {g,f,e,d,c,b,a}, active-high
);
    always @(*) begin
        case (bin_in)
            4'h0: seg_out = 7'h3F;
            4'h1: seg_out = 7'h06;
            4'h2: seg_out = 7'h5B;
            4'h3: seg_out = 7'h4F;
            4'h4: seg_out = 7'h66;
            4'h5: seg_out = 7'h6D;
            4'h6: seg_out = 7'h7D;
            4'h7: seg_out = 7'h07;
            4'h8: seg_out = 7'h7F;
            4'h9: seg_out = 7'h6F;
            4'hA: seg_out = 7'h77;
            4'hB: seg_out = 7'h7C;
            4'hC: seg_out = 7'h39;
            4'hD: seg_out = 7'h5E;
            4'hE: seg_out = 7'h79;
            4'hF: seg_out = 7'h71;
            default: seg_out = 7'h00;
        endcase
    end
endmodule