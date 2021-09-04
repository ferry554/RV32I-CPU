


module mem_wb_reg(
    input clk,
    input rst,
    input [1:0] wb_sel_i,
    input [31:0] alu_result_i,
    input [31:0] dram_get_i,
    input [31:0] npc_pc4_i,
    input [4:0] wright_reg_i,
    input rf_we_i,
    input rf_re_i,
    input [31:0] pc_i,


    output reg [1:0] wb_sel_o,
    output reg[31:0] alu_result_o,
    output reg[31:0] dram_get_o,
    output reg[31:0] npc_pc4_o,
    output reg[4:0] wright_reg_o,
    output reg rf_we_o,
    output reg rf_re_o,
    output reg [31:0] pc_o
    );
    always @(posedge clk or negedge rst) begin
        if(rst==0) wb_sel_o<=2'b0;
        else wb_sel_o<=wb_sel_i;
    end

    always @(posedge clk or negedge rst) begin
        if(rst==0) alu_result_o<=32'b0;
        else alu_result_o<=alu_result_i;
    end

    always @(posedge clk or negedge rst) begin
        if(rst==0) dram_get_o<=32'b0;
        else dram_get_o<=dram_get_i;
    end

    always @(posedge clk or negedge rst) begin
        if(rst==0) npc_pc4_o<=32'b0;
        else npc_pc4_o<=npc_pc4_i;
    end

    always @(posedge clk or negedge rst) begin
        if(rst==0) wright_reg_o<=4'b0;
        else wright_reg_o<=wright_reg_i;
    end

    always @(posedge clk or negedge rst) begin
        if(rst==0) rf_we_o<=1'b0;
        else rf_we_o<=rf_we_i;
    end

    always @(posedge clk or negedge rst) begin
        if(rst==0) rf_re_o<=1'b0;
        else rf_re_o<=rf_re_i;
    end
    
    always @(posedge clk or negedge rst) begin
            if(rst==0) pc_o<=32'b0;
            else pc_o<=pc_i;
        end

endmodule
