//`timescale 1ns / 1ps


module reg32(
    input clk,
    input rst,
    input wright_en,
    input [31:0] wright_data,
    output reg [31:0] out_data 
    );
    always @(posedge clk) begin
       if(rst==0)begin
            out_data<=32'b0;
       end
       if (wright_en==1) begin
           out_data<=wright_data;
       end 
    end
endmodule
