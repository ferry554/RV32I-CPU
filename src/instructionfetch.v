//`timescale 1ns / 1ps


module instructionfetch(
    input clk,
    input rst,
    input load_use_stall_flag,
    input npc_op,
    input [31:0]target_addr,
    output wire [31:0] p_c,
    output wire [31:0] pc4
    );
    wire [31:0] next_pc;
    wire [31:0] instruction_addr;
    wire [31:0] pc_plus_4;
    PC u_PC(
        clk,
        rst,
        load_use_stall_flag,
        next_pc,
        instruction_addr
    );
    NPC u_NPC(instruction_addr,target_addr,npc_op,pc_plus_4,next_pc);
    
     //assign   inst_addr=instruction_addr;
     assign   p_c=instruction_addr;
     assign   pc4=pc_plus_4;
    
endmodule
