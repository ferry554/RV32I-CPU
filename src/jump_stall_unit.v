
module jump_stall_unit(
    input [31:0] if_id_inst_o,
    input npc_op,
    output jump_stall_flag
    );
    wire [6:0]opcode;
    wire jump;

    assign opcode=if_id_inst_o[6:0];
    assign jump=(opcode==`B_type||opcode==`JARL||opcode==`JAL)?1:0;
    assign jump_stall_flag=(npc_op==1)?jump:0;
endmodule
