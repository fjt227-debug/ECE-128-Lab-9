
module CombinationalMult_TB();
reg [3:0] a,b;
reg clk;
reg done;
wire [6:0] seg_cathode;
wire[3:0] seg_anode;

TopComMult uut(.clk(clk), .a(a),.b(b),.done(done),.seg_anode(seg_anode), .seg_cathode(seg_cathode));
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
a = 4'b0001;
b = 4'b0011;
#10;
done = 1;
#200;
done = 0;
//test 2
a = 4'b1001;
b = 4'b1011;
#10;
done = 1;
#200;
done = 0;
//test 3
a = 4'b0100;
b = 4'b0101;
#10;
done = 1;
#200;
done = 0;
//test 4
a = 4'b0111;
b = 4'b0011;
#10;
done = 1;
#200;
done = 0;
$finish;
end

endmodule
