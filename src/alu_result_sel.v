//`timescale 1ns / 1ps


module alu_result_sel(
    input [1:0]result_choose,
    input [31:0] adder_result,
    input [31:0] logic_result,
    input [31:0] shift_result,
    input [31:0] bool,
    output reg [31:0] alu_result
    );
    always @(*) begin
        case (result_choose)
            2'b00:alu_result=adder_result;
            2'b01:alu_result=logic_result;
            2'b10:alu_result=shift_result;
            2'b11:alu_result=bool;
            default:alu_result=32'b0;
        endcase
    end
endmodule
