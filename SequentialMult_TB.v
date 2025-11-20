
module SequentialMult_TB();
reg clk, rst;
reg [3:0] a,b;
wire [6:0] seg_cathode;
wire [3:0] seg_anode;

TopSeqMult uut(.clk(clk),.rst(rst),.a(a),.b(b),.seg_anode(seg_anode), .seg_cathode(seg_cathode));
initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
rst = 1;
a=0;
b=0;
#20;
rst=0;
//test 1
a = 4'b0001;
b = 4'b0011;
#400;
//test 2
rst = 1;
#20;
rst=0;
a=4'b1111;
b= 4'b1111;
#200;
//test 3
rst = 1;
#20;
rst=0;
a=4'b1001;
b= 4'b0011;
#200;
//test 4
rst = 1;
#20;
rst=0;
a=4'b1101;
b= 4'b1100;
#200;
$finish;
end
    
endmodule
