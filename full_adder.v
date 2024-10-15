`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2024 02:03:09 PM
// Design Name: 
// Module Name: full_adder
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
//full adder



module full_adder(
//make inputs and outputs a,b,ci(carry in) and outputs: sum, co(carry out)
    input a,b,ci,
    output sum, co
    );
    assign sum = a^b^ci;
    assign co = (a&b)|(b&ci)|(a&ci);
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
module lookahead_adder(
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
