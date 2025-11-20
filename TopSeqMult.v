
module TopSeqMult(clk,rst,a,b,seg_anode, seg_cathode);
input clk, rst;
input [3:0] a,b;
output wire [3:0] seg_anode;
output wire[6:0] seg_cathode;

wire [7:0] product;
wire [15:0] bcd_d_out;
wire [11:0] product2;
wire en;
wire rdy;
reg [15:0] stat_bcd = 16'd0;
assign product2 = {4'd0, product};
SequentialMult uut1 (.clk(clk), .rst(rst), .a(a), .b(b), .product(product),.done(en));
Bin12to16BCD uut2(.clk(clk), .en(en), .bin_d_in(product2), .bcd_d_out(bcd_d_out), .rdy(rdy));
multisegDriver9 uut3(.clk(clk),.bcd_in(stat_bcd),.seg_anode(seg_anode),.seg_cathode(seg_cathode));


always @(posedge clk)
    begin
        if(rdy)
            begin 
                stat_bcd <= bcd_d_out;
            end
    end

endmodule
