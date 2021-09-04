//`timescale 1ns / 1ps
`include "param.v"

module alu_decoder(
    input [3:0] alu_op,
    output reg cin,
    output reg sign,
    output reg [1:0]logic_choose,
    output reg [1:0]shift_choose,
    output reg [1:0]result_choose
    );
    always@(*)begin
        case (alu_op)
            `add:begin
                cin=0;
                result_choose=2'b00;
            end //add
            `sub:begin
                cin=1;
                result_choose=2'b00;
            end //sub
            `logic_and:begin
                logic_choose=2'b00;
                result_choose=2'b01;
            end //and
            `logic_or:begin
                logic_choose=2'b01;
                result_choose=2'b01;
            end //or
            `logic_xor:begin
                logic_choose=2'b10;
                result_choose=2'b01;
            end//xor
            `sll:begin
                shift_choose=2'b00;
                result_choose=2'b10; 
            end //sll
            `srl:begin
                shift_choose=2'b01;
                result_choose=2'b10;
            end//srl
            `sra:begin
                shift_choose=2'b10;
                result_choose=2'b10;
            end//sra
            `slt:begin
                 sign=1;
                 result_choose=2'b11;           
            end
            `sltu:begin
                sign=0;
                result_choose=2'b11;
            end
            default: begin
                cin=0;
                sign=0;
                logic_choose=2'b00;
                result_choose=2'b00;
            end
        endcase
    end
endmodule
