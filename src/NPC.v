//`timescale 1ns / 1ps


module NPC(
    input [31:0] pc,
    input [31:0] alu_result,
    input npc_op,
    output [31:0] pc4,
    output [31:0] npc
    );
    
    assign pc4=pc+4;
    assign npc=(npc_op==0)?(pc+4):alu_result;
   
endmodule
