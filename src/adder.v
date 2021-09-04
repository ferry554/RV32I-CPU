//`timescale 1ns / 1ps

module adder(
    input [31:0]a,
    input [31:0]b,
    input cin,
    output wire [31:0] adder_result
    );
    
    assign adder_result=a+b+cin;
    

endmodule
