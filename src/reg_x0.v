//`timescale 1ns / 1ps


module reg_x0(
    input clk,
    input wright_en,
    input [31:0] wright_data,
    output wire [31:0] out_data 
    );
    
    assign out_data=32'b0;
    
endmodule
