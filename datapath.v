module datapath(clk,reset,cor_enter,cor_exit);

input clk;
input reset;
input cor_enter;
input cor_exit;

output reg [3:0] cnt;

always @(posedge clk) begin
    if(reset) begin
        cnt <= 0;
    end else begin
        if(cor_enter) begin
            cnt <= cnt + 1 ;
        end else if(cor_exit) begin
            cnt <= cnt - 1 ;
        end else begin
            cnt <= cnt ;
        end
    end
end