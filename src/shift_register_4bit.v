module shift_register_4bit(
    input reg clk,
    input  reg reset_in,
    output wire [3:0] shift_out

);
reg [3:0] Q;
always @(negedge clk or negedge reset_in)
begin
    if (!reset_in)
        Q <=4'b1000;
        else 
        begin
            Q[3] <= Q[0];
            Q[2] <= Q[3];
            Q[1] <= Q[2];
            Q[0] <= Q[1];
            
        end
end
assign shift_out= Q;
endmodule
