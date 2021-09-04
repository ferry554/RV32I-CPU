
module data_forwarding_unit(
    input [31:0] if_id_inst_o,
    input [4:0] id_exe_wright_reg,
    input id_exe_rf_we_o,
    input [4:0] exe_mem_wright_reg,
    input exe_mem_rf_we_o,
    input [4:0] mem_wb_wright_reg,
    input mem_wb_rf_we_o,
    input rf_re,
    input [4:0] rf_rd_regnum_1,
    input [4:0] rf_rd_regnum_2,


    input [31:0] exe_alu_result,
    input [31:0] exe_pc4,
    input [1:0] exe_wb_sel,


    input [31:0] mem_alu_result,
    input [31:0] mem_dram_get,
    input [31:0] mem_pc4,
    input [1:0] mem_wb_sel,

    
    input [31:0] wb_data,

    output rf_rd1_forwarding_sel,
    output rf_rd2_forwarding_sel,
    output [31:0] rf_rd1_forwarding_data,
    output [31:0] rf_rd2_forwarding_data,
    
    output wire load_use_stall_flag
    );
    wire [31:0]exe_forward_data,mem_forward_data,wb_forward_data;
    assign exe_forward_data=(exe_wb_sel==0)?exe_alu_result:
                            (exe_wb_sel==2)?exe_pc4:
                            (exe_wb_sel==1)?mem_dram_get:
                            32'b0;
    assign mem_forward_data=(mem_wb_sel==0)? mem_alu_result:
                            (mem_wb_sel==2)?mem_pc4:
                            (mem_wb_sel==1)?mem_dram_get:
                            32'b0;
    assign wb_forward_data=wb_data;  

    wire rd1_exe,rd2_exe,rd1_mem,rd2_mem,rd1_wb,rd2_wb;
    assign rd1_exe=((id_exe_wright_reg==rf_rd_regnum_1)&&(rf_rd_regnum_1!=0))?1:0;
    assign rd2_exe=((id_exe_wright_reg==rf_rd_regnum_2)&&(rf_rd_regnum_2!=0))?1:0;
    assign rd1_mem=((exe_mem_wright_reg==rf_rd_regnum_1)&&(rf_rd_regnum_1!=0))?1:0;
    assign rd2_mem=((exe_mem_wright_reg==rf_rd_regnum_2)&&(rf_rd_regnum_2!=0))?1:0;
    assign rd1_wb=((mem_wb_wright_reg==rf_rd_regnum_1)&&(rf_rd_regnum_1!=0))?1:0;
    assign rd2_wb=((mem_wb_wright_reg==rf_rd_regnum_2)&&(rf_rd_regnum_2!=0))?1:0;

    wire rd1_exe_forward_flag;
    wire rd2_exe_forward_flag;
    wire rd1_mem_forward_flag;
    wire rd2_mem_forward_flag;
    wire rd1_wb_forward_flag;
    wire rd2_wb_forward_flag;
    assign rd1_exe_forward_flag=(rd1_exe&&id_exe_rf_we_o&&rf_re)?1:0;
    assign rd2_exe_forward_flag=(rd2_exe&&id_exe_rf_we_o&&rf_re)?1:0;
    assign rd1_mem_forward_flag=(rd1_mem&&exe_mem_rf_we_o&&rf_re)?1:0;
    assign rd2_mem_forward_flag=(rd2_mem&&exe_mem_rf_we_o&&rf_re)?1:0;
    assign rd1_wb_forward_flag=(rd1_wb&&mem_wb_rf_we_o&&rf_re)?1:0;
    assign rd2_wb_forward_flag=(rd2_wb&&mem_wb_rf_we_o&&rf_re)?1:0;
    
    assign rf_rd1_forwarding_sel=rd1_exe_forward_flag|rd1_mem_forward_flag|rd1_wb_forward_flag;
    assign rf_rd2_forwarding_sel=rd2_exe_forward_flag|rd2_mem_forward_flag|rd2_wb_forward_flag;
    
    assign rf_rd1_forwarding_data=(rd1_exe_forward_flag==1)?exe_forward_data:
                                  (rd1_mem_forward_flag==1)?mem_forward_data:
                                  (rd1_wb_forward_flag==1)?wb_forward_data:
                                  32'b0;

    assign rf_rd2_forwarding_data=(rd2_exe_forward_flag==1)?exe_forward_data:
                                  (rd2_mem_forward_flag==1)?mem_forward_data:
                                  (rd2_wb_forward_flag==1)?wb_forward_data:
                                  32'b0;                              
    
    assign load_use_stall_flag=((rd1_exe_forward_flag|rd2_exe_forward_flag)==1&&exe_wb_sel==1)?1:0;
    
    
    
    //,rd2_exe,rd1_mem,rd2_mem,rd1_wb,rd2_wb;

    /*wire exe_forward_flag,mem_forward_flag,wb_forward_flag;
    assign exe_forward_flag=(rd1_exe|rd2_exe)&id_exe_rf_we_o&rf_re;
    assign mem_forward_flag=(rd1_mem|rd2_mem)&exe_mem_rf_we_o&rf_re;
    assign wb_forward_flag=(rd1_wb|rd2_wb)&mem_wb_rf_we_o&rf_re;

    wire rd1_forward_flag;
    assign rd1_forward_flag=

    
    */
    
                      

    /*always @(*) begin
        if (exe_forward_flag==1&&exe_wb_sel==0) begin
            rf_rd1_forwarding_data=exe_alu_result;
        end
        else if (exe_forward_flag==1&&exe_wb_sel==2) begin
            rf_rd1_forwarding_data=exe_pc4;
        end
        else if (exe_forward_flag==1&&exe_wb_sel==1) begin
            rf_rd1_forwarding_data=mem_dram_get;
        end
        else if (mem_forward_flag==1&&mem_wb_sel==0) begin
            rf_rd1_forwarding_data=mem_alu_result;
        end
        else if (mem_forward_flag==1&&mem_wb_sel==2) begin
            rf_rd1_forwarding_data=mem_pc4;
        end
        else if (mem_forward_flag==1&&mem_wb_sel==1) begin
            rf_rd1_forwarding_data=mem_dram_get;
        end
        else if (wb_forward_flag==1) begin
            rf_rd1_forwarding_data=wb_data;
        end
        else begin
            rf_rd1_forwarding_data=32'b0;
        end
    end*/


endmodule
