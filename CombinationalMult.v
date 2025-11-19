
module CombinationalMult(a,b,product);
input [3:0] a,b; 
output [7:0] product;

wire [3:0] m0;
wire [4:0] m1;
wire [5:0] m2;
wire [6:0] m3;

wire [7:0] s1,s2,s3;
//can we use concatenation?
assign m0= a &{4{b[0]}};     
assign m1 = {(a&{4{b[1]}}), 1'b0};
assign m2={(a&{4{b[2]}}), 2'b0};
assign m3={(a&{4{b[3]}}), 3'b0};
//add or use ripple carry
assign s1= {4'b0000, m0} + {3'b000, m1};
assign s2= s1 + {2'b00, m2};
assign s3 = s2 + {1'b0, m3}; 
assign product = s3;
endmodule
