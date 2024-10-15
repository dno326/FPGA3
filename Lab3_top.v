`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2024 03:17:20 PM
// Design Name: 
// Module Name: Lab3_top
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


module Lab3_top(at,bt,ci,segt);

input[1:0]at,bt;
input ci;
output [6:0] segt;

wire co;
wire [1:0]sum;
wire[3:0]bcd;
assign bcd={1'b0,co,sum};
carry_adder ca(at,bt,ci,sum,co);//ripple carry
//lookahead_adder uut1(at,bt,ci,sum,co);// carry lookahed
BCD_7 led(bcd,segt);
    
   
endmodule



module BCD_7(i,seg);
input[3:0]i;
output reg [6:0] seg;

always @(i)
begin
   case (i)
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
   default: seg = 7'bxxxxxx;
 endcase
end
endmodule


//carry adder with full adder
module carry_adder(
    input [1:0]a,b,
    input ci,
    output[1:0]sum,
    output co
);
    wire c1;
    full_adder f0 (a[0],b[0],ci,sum[0],c1);
    full_adder f1 (a[1],b[1],c1,sum[1],co);
endmodule

//look ahead adder
/*module lookahead_adder(
    input[1:0]a,b,
    input ci,
    output[1:0]sum,
    output co    
);
    wire s0,s1,t0,t1;
    wire c1,c2;
    
    assign s0 = a[0]^b[0];
    assign s1 = a[1]^b[1];
    assign t0 = a[0]&b[0];
    assign t1 = a[1]&b[1];
    
    assign c1=t0|(s0&ci);
    assign c2=t1|(s1&c1);
    
    assign sum[0]=s0^ci;
    assign sum[1]=s1^c1;
    assign co=c2;
endmodule




*/
module full_adder(
//make inputs and outputs a,b,ci(carry in) and outputs: sum, co(carry out)
    input a,b,ci,
    output sum, co
    );
    assign sum = a^b^ci;
    assign co = (a&b)|(b&ci)|(a&ci);
endmodule


