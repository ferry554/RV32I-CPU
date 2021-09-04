//`timescale 1ns / 1ps


module ALU(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_op,
    output  [31:0] c
    );
    wire cin;
    wire sign;
    
    wire [1:0]logic_choose;
    wire [1:0]shift_choose;
    wire [1:0]result_choose;
    wire [31:0]b_result;
    
    wire [31:0] adder_result;
    wire [31:0] logic_result;
    wire [31:0] shift_result;
    wire [31:0] bool;
    
    alu_decoder u_alu_decoder(alu_op,cin,sign,logic_choose,shift_choose,result_choose);
    adder_b_sel u_adder_b_sel(b,cin,b_result);
    adder u_adder(a,b_result,cin,adder_result);
    logic_unit u_logic_unit(a,b,logic_choose,logic_result);
    shift_unit u_shift_unit(a,b,shift_choose,shift_result);
    set_on u_set_on(sign,a,b,bool);
    alu_result_sel u_alu_result_sel(result_choose,adder_result,logic_result,shift_result,bool,c);
    
    
endmodule
