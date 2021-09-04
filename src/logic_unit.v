//`timescale 1ns / 1ps


module logic_unit(
    input [31:0] a,
    input [31:0] b,
    input [1:0] logic_choose,
    output reg [31:0] logic_result
    );
    always @(*) begin
        case (logic_choose)
            2'b00:logic_result=a&b;
            2'b01:logic_result=a|b;
            2'b10:logic_result=a^b;
            default:logic_result=32'b0; 
        endcase
    end
endmodule
