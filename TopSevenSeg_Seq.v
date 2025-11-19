`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 05:24:00 PM
// Design Name: 
// Module Name: TopSevenSeg_Seq
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopSevenSeg_Seq(clk,rst,a,b,seg);
input clk;
input rst;
input [3:0]a;
input [3:0]b;
output reg [6:0]seg;

wire [7:0] product;

Sequential_Multi DUT(.clk(clk),.rst(rst),.a(a),.b(b),.product(product));
 always @* begin
        case (product[3:0])
           4'b0000: seg = 7'b1000000;
           4'b0001: seg = 7'b1111001;
           4'b0010: seg = 7'b0100100;
           4'b0011: seg = 7'b0110000;
           4'b0100: seg = 7'b0011001;
           4'b0101: seg = 7'b0010010;
           4'b0110: seg = 7'b0000010;
           4'b0111: seg = 7'b1111000;
           4'b1000: seg = 7'b0000000;
           4'b1001: seg = 7'b0010000;
           default: seg = 7'b1111111;
        endcase
      end
endmodule
