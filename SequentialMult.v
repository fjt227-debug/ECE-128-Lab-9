
module SequentialMult(clk, rst, a, b, product,done);
input clk, rst;
input [3:0] a,b;
output reg[7:0] product; 
output reg done;
parameter s0_idle = 0, s1_multiply = 1, s2_update_result = 2, s3_done = 3;

reg[2:0] PS, NS;
reg [7:0] partial_product; 
reg [2:0] shift_count;
reg [7:0]multiplicand; //shifted value of a
reg [3:0] operand_bb; //shifted value of b

always @(posedge clk)
    begin
        if(rst)
            PS <= s0_idle;
        else
            PS <= NS;
    end
always@(posedge clk)
    begin
        case(PS)
            s0_idle: begin
          
                partial_product <= 8'b0;
                shift_count <= 0;
                multiplicand <= {4'b0000, a};
                operand_bb <= b;
                done <= 0;
                NS <= s1_multiply;   
            end
            s1_multiply: begin
                NS <= s2_update_result;
                //dont add
                if((operand_bb[0] == 0) && (shift_count < 4)) begin
                    partial_product <= partial_product;
                    shift_count <= shift_count + 1;
                    multiplicand <= multiplicand << 1;
                    operand_bb <= operand_bb >>1;
                end
                //add
                else if((operand_bb[0] == 1) && (shift_count < 4)) begin
                    partial_product <= partial_product + multiplicand;
                    shift_count <= shift_count + 1;
                    multiplicand <= multiplicand << 1;
                    operand_bb <= operand_bb >>1;
                end
            end
            s2_update_result: begin
                if(shift_count == 4) begin
                    NS <= s3_done;
                    product <= partial_product;
                end
                else begin
                    NS <= s1_multiply;
                end
            end
            s3_done: begin
                done <= 1'b1;
                NS <= s3_done;
            end
        endcase
    end

endmodule
