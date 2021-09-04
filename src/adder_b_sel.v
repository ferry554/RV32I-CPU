//`timescale 1ns / 1ps


module adder_b_sel(
    input [31:0] bin,
    input cin,
    output wire [31:0] bout
    );
    
    assign bout=(cin==0)?bin:~bin;
endmodule
