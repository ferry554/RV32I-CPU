//`include "param.v"


module data_stall_unit(
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

    
    output wire data_stall_flag
    );
    
    wire rd1_s3,rd2_s3,rd1_s2,rd2_s2,rd1_s1,rd2_s1;
    assign rd1_s3=(id_exe_wright_reg==rf_rd_regnum_1)?1:0;
    assign rd2_s3=(id_exe_wright_reg==rf_rd_regnum_2)?1:0;
    assign rd1_s2=(exe_mem_wright_reg==rf_rd_regnum_1)?1:0;
    assign rd2_s2=(exe_mem_wright_reg==rf_rd_regnum_2)?1:0;
    assign rd1_s1=(mem_wb_wright_reg==rf_rd_regnum_1)?1:0;
    assign rd2_s1=(mem_wb_wright_reg==rf_rd_regnum_2)?1:0;
    
    wire s3,s2,s1;
    assign s3=rd1_s3|rd2_s3;
    assign s2=rd1_s2|rd2_s2;
    assign s1=rd1_s1|rd2_s1;
    
    wire stall_1cycle_flag;
    wire stall_2cycle_flag;
    wire stall_3cycle_flag;
    
    /*assign stall_1cycle_flag=(mem_wb_rf_we_o&&s1&&mem_wb_rf_re_o)?1:0;
    assign stall_2cycle_flag=(exe_mem_rf_we_o&&s2&&exe_mem_rf_re_o)?1:0;
    assign stall_3cycle_flag=(id_exe_rf_we_o&&s3&&id_exe_rf_re_o)?1:0;*/
    
    assign stall_1cycle_flag=(mem_wb_rf_we_o&&s1&&rf_re)?1:0;
    assign stall_2cycle_flag=(exe_mem_rf_we_o&&s2&&rf_re)?1:0;
    assign stall_3cycle_flag=(id_exe_rf_we_o&&s3&&rf_re)?1:0;

    assign data_stall_flag=stall_1cycle_flag|stall_2cycle_flag|stall_3cycle_flag;
    
    /*
    always@(*)begin
        if(stall_3cycle_flag==1)begin
            data_stall_1cycle_flag=1;
            data_stall_2cycle_flag=1;
            data_stall_3cycle_flag=1;
        end
        else if (stall_2cycle_flag==1) begin
            data_stall_1cycle_flag=1;
            data_stall_2cycle_flag=1;
            data_stall_3cycle_flag=0;
        end
        else if (stall_1cycle_flag==1) begin
            data_stall_flag=1;
        end
        else begin
            data_stall_flag=0;
        end
    end*/
   
    
endmodule
