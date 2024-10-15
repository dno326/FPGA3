`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2024 03:21:31 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();
    
    reg[1:0]a,b;
    reg ci;
    wire[1:0] sum_r,sum_l;
    wire co_r, co_l;
    
    carry_adder ca (a,b,ci,sum_r,co_r);
   lookahead_adder la (a,b,ci,sum_l,co_l);
    
    initial begin
        a=2'b00;b=2'b00;ci=0; #10;
        a=2'b01;b=2'b10;ci=0; #10;
        a=2'b11;b=2'b11;ci=0; #10;
        $stop;
    end
endmodule

