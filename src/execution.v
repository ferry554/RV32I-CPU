//`timescale 1ns / 1ps


module execution(
    //input sign,
    input [3:0] alu_op,
    input [1:0] alua_sel,
    input [31:0]PC_pc,
    input [31:0]RF_rd1,
    input [31:0]RF_rd2,
    input [31:0]SEXT_ext,
    input [1:0]alub_sel,
    output  [31:0] alu_result
    );
    wire [31:0] alu_a,alu_b;
    //assign alu_a=(alua_sel==0)?32'b0:RF_rd1;
    //assign alu_b=(alub_sel==0)?RF_rd1:SEXT_ext;
    exe_multiplexer u_exe_multiplexer_1(PC_pc,RF_rd1,alua_sel,alu_a);
    exe_multiplexer u_exe_multiplexer_2(RF_rd2,SEXT_ext,alub_sel,alu_b);
    ALU u_ALU(alu_a,alu_b,alu_op,alu_result);

    
endmodule
