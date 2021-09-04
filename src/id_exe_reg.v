


module id_exe_reg(
    input clk,
    input rst,
    input load_use_stall_flag,
    input [1:0] wb_sel_i,
    input [1:0] alu_a_sel_i,
    input [1:0] alu_b_sel_i,
    input [3:0] alu_op_i,
    input [31:0] npc_pc4_i,
    input [4:0] wright_reg_i,
    input dram_we_i,
    input [31:0] pc_i,
    input [31:0] rf_rd1_i,
    input [31:0] rf_rd2_i,
    input [31:0] sext_i,
    input rf_we_i,
    input rf_re_i,


    output reg [1:0] wb_sel_o,
    output reg [1:0] alu_a_sel_o,
    output reg [1:0] alu_b_sel_o,
    output reg [3:0] alu_op_o,
    output reg [31:0] npc_pc4_o,
    output reg [4:0] wright_reg_o,
    output reg dram_we_o,
    output reg [31:0] pc_o,
    output reg [31:0] rf_rd1_o,
    output reg [31:0] rf_rd2_o,
    output reg [31:0] sext_o,
    output reg rf_we_o,
    output reg rf_re_o
    );
     
     /*always @(posedge clk) begin
         if (jump_stall_flag==1) begin
            flag=1;
         end
     end*/
       
       /*
       always @(posedge stall_flag) begin
           cnt<=stall_cycle_num;
       end
   
       always @(posedge clk) begin
           if (stall_flag==1) begin
               cnt<=(cnt==0)?0:cnt-1;
           end
      
       end*/
          /*always @(posedge clk) begin
           if (rst==0) begin 
            cnt<=0;
           end
               else if (stall_flag==1) begin
                    cnt<=stall_cycle_num;
               end
               else begin
                    cnt<=(cnt==0)?0:cnt-1;
               end
               
           end*/

    always @(posedge clk) begin
        if(rst==0||load_use_stall_flag==1) begin
            wb_sel_o<=2'b0;
            alu_a_sel_o<=2'b0;
            alu_b_sel_o<=2'b0;
            alu_op_o<=4'b0;
            npc_pc4_o<=32'b0;
            wright_reg_o<=4'b0;
            dram_we_o<=1'b0;
            pc_o<=32'b0;
            rf_rd1_o<=32'b0;
            rf_rd2_o<=32'b0;
            sext_o<=32'b0;
            rf_we_o<=1'b0;
            rf_re_o<=1'b0;
        end        
        else begin
        //else if (flag==0) begin
            wb_sel_o<=wb_sel_i;
            alu_a_sel_o<=alu_a_sel_i;
            alu_b_sel_o<=alu_b_sel_i;
            alu_op_o<=alu_op_i;
            npc_pc4_o<=npc_pc4_i;
            wright_reg_o<=wright_reg_i;
            dram_we_o<=dram_we_i;
            pc_o<=pc_i;
            rf_rd1_o<=rf_rd1_i;
            rf_rd2_o<=rf_rd2_i;
            sext_o<=sext_i;
            rf_we_o<=rf_we_i;
            rf_re_o<=rf_re_i;
        end
        /*
        else if (cnt==0&&stall_flag==1) begin
        
            wb_sel_o<=(cnt==0)?wb_sel_i:wb_sel_o;
            alu_a_sel_o<=(cnt==0)?alu_a_sel_i:alu_a_sel_o;
            alu_b_sel_o<=(cnt==0)?alu_b_sel_i:alu_b_sel_o;
            alu_op_o<=(cnt==0)?alu_op_i:alu_op_o;
            npc_pc4_o<=(cnt==0)?npc_pc4_i:npc_pc4_o;
            wright_reg_o<=(cnt==0)?wright_reg_i:wright_reg_o;
            dram_we_o<=(cnt==0)?dram_we_i:dram_we_o;
            pc_o<=(cnt==0)?pc_i:pc_o;
            rf_rd1_o<=(cnt==0)?rf_rd1_i:rf_rd1_o;
            rf_rd2_o<=(cnt==0)?rf_rd2_i:rf_rd2_o;
            sext_o<=(cnt==0)?sext_i:sext_o;
            rf_we_o<=(cnt==0)?rf_we_i:rf_we_o;
            rf_re_o<=(cnt==0)?rf_re_i:rf_re_o;
            wb_sel_o<=wb_sel_o;
                        alu_a_sel_o<=(cnt==0)?alu_a_sel_i:alu_a_sel_o;
                        alu_b_sel_o<=(cnt==0)?alu_b_sel_i:alu_b_sel_o;
                        alu_op_o<=(cnt==0)?alu_op_i:alu_op_o;
                        npc_pc4_o<=(cnt==0)?npc_pc4_i:npc_pc4_o;
                        wright_reg_o<=(cnt==0)?wright_reg_i:wright_reg_o;
                        dram_we_o<=(cnt==0)?dram_we_i:dram_we_o;
                        pc_o<=(cnt==0)?pc_i:pc_o;
                        rf_rd1_o<=(cnt==0)?rf_rd1_i:rf_rd1_o;
                        rf_rd2_o<=(cnt==0)?rf_rd2_i:rf_rd2_o;
                        sext_o<=(cnt==0)?sext_i:sext_o;
                        rf_we_o<=(cnt==0)?rf_we_i:rf_we_o;
                        rf_re_o<=(cnt==0)?rf_re_i:rf_re_o;
        end*/
        
    end
endmodule
