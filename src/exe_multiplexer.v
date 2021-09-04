//`timescale 1ns / 1ps


module exe_multiplexer(
    input [31:0] a,
    input [31:0] b,
    input [1:0] sel,
    output reg [31:0] c 
    );
    always @(*) begin
        case(sel)
        2'b00:c=a;
        2'b01:c=b;
        2'b10:c=32'b0;
        default:c=32'b0;
        endcase
    end
endmodule
