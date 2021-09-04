//`timescale 1ns / 1ps

module instructiondecode(
    input clk,
    input rst,
    input [24:0]inst,
    input [31:0]wb_data,
    input cu_rf_we,
    input [2:0]sext_op,
    input br_un,
    input [4:0] mem_wb_reg_wnum,
    input rf_rd1_forwarding_sel,
    input rf_rd2_forwarding_sel,
    input [31:0] rf_rd1_forwarding_data,
    input [31:0] rf_rd2_forwarding_data,
    
    output [31:0]rf_rd1_out,
    output  [31:0]rf_rd2_out,
    output  [31:0]sext_ext,
    output  br_eq,
    output  br_lt,
    output [4:0] regfile_wnum,
    output [31:0] regfile_wdata,
    output [4:0] rf_rd_regnum_1,
    output [4:0] rf_rd_regnum_2,
    output [31:0] reg19_data
    );
    wire [4:0]rr1,rr2;
    //wire [6:0]opcode;
    //wire [31:0]wb_data;
    assign rr1=inst[12:8];
    assign rr2=inst[17:13];
    //assign opcode=inst[6:0];
    wire [31:0]rf_rd1,rf_rd2;
    
    wire [31:0] real_rf_rd1,real_rf_rd2;
    
    //wire [31:0] rd1;
    //wire [31:0] sext_ext;
    //assign rf_rd1=rd1;
    //assign sext_ext_out=sext_ext;
    //assign wr=mem_wb_reg_wnum;
    //wrightback_multiplexer u_wrightback_multiplexer(alu_result,dram_get,npc_pc4,cu_wd_sel,wb_data);
    regfile u_regfile(clk,rst,rr1,rr2,mem_wb_reg_wnum,wb_data,cu_rf_we,rf_rd1,rf_rd2,reg19_data);
    signext u_signext(inst,sext_op,sext_ext);
    
    assign real_rf_rd1=(rf_rd1_forwarding_sel==1)?rf_rd1_forwarding_data:rf_rd1;
    assign real_rf_rd2=(rf_rd2_forwarding_sel==1)?rf_rd2_forwarding_data:rf_rd2;
    
    branchcomp u_branchcomp(real_rf_rd1,real_rf_rd2,br_un,br_eq,br_lt);
    
    assign regfile_wnum=inst[4:0];
    assign regfile_wdata=wb_data;
    assign rf_rd_regnum_1=inst[12:8];
    assign rf_rd_regnum_2=inst[17:13];
    
    //assign target_addr=(opcode==`JARL)?(rd1+sext_ext):(pc+sext_ext);
    
    assign rf_rd1_out=real_rf_rd1;
    assign rf_rd2_out=real_rf_rd2;
    
endmodule
