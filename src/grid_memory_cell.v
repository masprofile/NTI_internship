module grid_mem_router #(parameter WORD_WIDTH=32)
(
    input wire clk,
     input wire Rst,
     input wire oe,
     input wire endian_swap,
     input wire [1:0] row_addr,
     input wire col_addr,
     output reg [WORD_WIDTH-1:0] processing_word,
     inout wire [7:0] bus_data
     );
     reg [7:0] fabric_mem[0:3][0:1];
     assign bus_data= oe? fabric_mem[row_addr][col_addr]: 8'bz;
      integer i;
     always @(posedge clk or posedge Rst)
     begin
            if(Rst) begin
                processing_word <= 0;
            end else begin
            for (i=0; i<4; i=i+1) begin
                if(endian_swap==0) begin
                    processing_word[(i*8)+:8] <= fabric_mem[i][0];
                end else begin
                    processing_word[((3-i)*8+7)-:8] <= fabric_mem[i][0];
                end
            end
        end
        end
        endmodule
        

            