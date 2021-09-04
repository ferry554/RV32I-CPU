

module cpu(
    input clock,
    input rst,
    input [31:0]inst,
    input [31:0]dram_get_data,
    
    output [31:0] inst_addr,
    output [31:0] dram_wright_addr,
    output [31:0] dram_wright_data,
    output dram_we,


    output debug_wb_have_inst,   
    output [31:0] debug_wb_pc,   
    output debug_wb_ena,
    output [4:0]debug_wb_reg,
    output [31:0] debug_wb_value
    );
    wire npc_op;
    wire [31:0]alu_result;    
    wire [31:0]pc;
    wire [31:0]pc4;
    wire [31:0]sext_ext; 
    wire [31:0]target_addr;  
    
    //wire data_stall_flag;
    wire load_use_stall_flag;
    wire jump_stall_flag;
    
    instructionfetch u_instructionfetch(
        clock,
        rst,
        load_use_stall_flag,
        npc_op,
        target_addr,
        pc,
        pc4 
    );
    
    assign inst_addr=pc;
    
    wire [31:0]if_id_pc_o;
    wire [31:0]if_id_pc4_o;
    wire [31:0]if_id_inst_o;
    
    if_id_reg u_if_id_reg(
        clock,
        rst,
        load_use_stall_flag,
        jump_stall_flag,
        pc,
        pc4,
        inst,
        if_id_pc_o,
        if_id_pc4_o,
        if_id_inst_o
    );
    
    

    wire [1:0]wb_sel;
    wire rf_we;
    wire [2:0]sext_op;
    wire [31:0]rf_rd1;
    wire [31:0]rf_rd2;
    
    wire [4:0]wnum;
    wire [31:0]wdata;
    
    wire br_eq;
    wire br_lt;
    wire br_un;
    
    wire [31:0]wright_back_wb_data;
    wire mem_wb_rf_we_o;
    wire [4:0] mem_wb_wright_reg_o;

    wire [4:0] rf_rd_regnum_1;
    wire [4:0] rf_rd_regnum_2; 
    
    wire rf_rd1_forwarding_sel;
    wire rf_rd2_forwarding_sel;
    wire [31:0] rf_rd1_forwarding_data;
    wire [31:0] rf_rd2_forwarding_data;
    
    wire [31:0] reg19_data;
    instructiondecode u_instructiondecode(
        clock,
        rst,
        if_id_inst_o[31:7],
        wright_back_wb_data,
        mem_wb_rf_we_o,
        sext_op,
        br_un,
        mem_wb_wright_reg_o,
        rf_rd1_forwarding_sel,
        rf_rd2_forwarding_sel,
        rf_rd1_forwarding_data,
        rf_rd2_forwarding_data,
        
        
        rf_rd1,
        rf_rd2,
        sext_ext,
        br_eq,
        br_lt,
        wnum,
        wdata,
        rf_rd_regnum_1,
        rf_rd_regnum_2,
        reg19_data       
    );
    
    wire [31:0]base;
    assign base=(if_id_inst_o[6:0]==`JARL)?rf_rd1:if_id_pc_o;
    assign target_addr=base+sext_ext;
    
    wire [3:0]alu_op;
    wire [1:0]alua_sel;
    wire [1:0]alub_sel;
    wire dram_we_i;
    wire rf_re;
    
    control_unit u_control_unit(
            if_id_inst_o,
            br_eq,
            br_lt,
            br_un,
            npc_op,
            rf_we,
            wb_sel,
            sext_op,
            alu_op,
            alua_sel,
            alub_sel,
            dram_we_i,
            rf_re     
    );
    
    
    wire [1:0] id_exe_wb_sel_o;
    wire [1:0] id_exe_alu_a_sel_o;
    wire [1:0] id_exe_alu_b_sel_o;
    wire [3:0] id_exe_alu_op_o;
    wire [31:0] id_exe_npc_pc4_o;
    wire [4:0] id_exe_wright_reg_o;
    wire id_exe_dram_we_o;
    wire [31:0] id_exe_pc_o;
    wire [31:0] id_exe_rf_rd1_o;
    wire [31:0] id_exe_rf_rd2_o;
    wire [31:0] id_exe_sext_o;
    wire id_exe_rf_we_o;
    wire id_exe_rf_re_o;

    id_exe_reg u_id_exe_reg(
        clock,
        rst,
        load_use_stall_flag,
        wb_sel,
        alua_sel,
        alub_sel,
        alu_op,
        if_id_pc4_o,
        wnum,
        dram_we_i,
        if_id_pc_o,
        rf_rd1,
        rf_rd2,
        sext_ext,
        rf_we,
        rf_re,

        id_exe_wb_sel_o,
        id_exe_alu_a_sel_o,
        id_exe_alu_b_sel_o,
        id_exe_alu_op_o,
        id_exe_npc_pc4_o,
        id_exe_wright_reg_o,
        id_exe_dram_we_o,
        id_exe_pc_o,
        id_exe_rf_rd1_o,
        id_exe_rf_rd2_o,
        id_exe_sext_o,
        id_exe_rf_we_o,
        id_exe_rf_re_o
    );

    
    

    
    execution u_execution(
        id_exe_alu_op_o,
        id_exe_alu_a_sel_o,
        id_exe_pc_o,
        id_exe_rf_rd1_o,
        id_exe_rf_rd2_o,
        id_exe_sext_o,
        id_exe_alu_b_sel_o,
        alu_result
    );
     
    

    wire [1:0] exe_mem_wb_sel_o;
    wire [31:0] exe_mem_alu_result_o;
    wire [31:0] exe_mem_npc_pc4_o;
    wire [4:0] exe_mem_wright_reg_o;
    wire exe_mem_dram_we_o;
    wire [31:0] exe_mem_dram_wright_data_o;
    wire exe_mem_rf_we_o;
    wire exe_mem_rf_re_o;
    wire [31:0] exe_mem_pc_o;

    exe_mem_reg u_exe_mem_reg(
        clock,
        rst,
        id_exe_wb_sel_o,
        alu_result,
        id_exe_npc_pc4_o,
        id_exe_wright_reg_o,
        id_exe_dram_we_o,
        id_exe_rf_rd2_o,
        id_exe_rf_we_o,
        id_exe_rf_re_o,
        id_exe_pc_o,

        exe_mem_wb_sel_o,
        exe_mem_alu_result_o,
        exe_mem_npc_pc4_o,
        exe_mem_wright_reg_o,
        exe_mem_dram_we_o,
        exe_mem_dram_wright_data_o,
        exe_mem_rf_we_o,
        exe_mem_rf_re_o,
        exe_mem_pc_o
    );

    assign dram_wright_addr=exe_mem_alu_result_o;    
    assign dram_wright_data=exe_mem_dram_wright_data_o;
    assign dram_we=exe_mem_dram_we_o;

    wire [1:0] mem_wb_wb_sel_o;
    wire [31:0] mem_wb_alu_result_o;
    wire [31:0] mem_wb_dram_get_o;
    wire [31:0] mem_wb_npc_pc4_o;
    wire mem_wb_rf_re_o;
    wire [31:0] mem_wb_pc_o;
    
    
    mem_wb_reg u_mem_wb_reg(
        clock,
        rst,
        exe_mem_wb_sel_o,
        exe_mem_alu_result_o,
        dram_get_data,
        exe_mem_npc_pc4_o,
        exe_mem_wright_reg_o,
        exe_mem_rf_we_o,
        exe_mem_rf_re_o,
        exe_mem_pc_o,

        mem_wb_wb_sel_o,
        mem_wb_alu_result_o,
        mem_wb_dram_get_o,
        mem_wb_npc_pc4_o,
        mem_wb_wright_reg_o,
        mem_wb_rf_we_o,
        mem_wb_rf_re_o,
        mem_wb_pc_o
    );
     
    wright_back u_wright_back(
       mem_wb_alu_result_o,
       mem_wb_dram_get_o,
       mem_wb_npc_pc4_o,
       mem_wb_wb_sel_o, 
       wright_back_wb_data  
    ); 
    
    data_forwarding_unit u_data_forwarding_unit( 
        if_id_inst_o,    
        id_exe_wright_reg_o,
        id_exe_rf_we_o,
        exe_mem_wright_reg_o,
        exe_mem_rf_we_o,
        mem_wb_wright_reg_o,
        mem_wb_rf_we_o,
        rf_re,
        rf_rd_regnum_1,
        rf_rd_regnum_2,
        
        
        alu_result,
        id_exe_npc_pc4_o,
        id_exe_wb_sel_o,
        
        exe_mem_alu_result_o,
        dram_get_data,
        exe_mem_npc_pc4_o,
        exe_mem_wb_sel_o,
        
        wright_back_wb_data,
        
        rf_rd1_forwarding_sel,
        rf_rd2_forwarding_sel,
        rf_rd1_forwarding_data,
        rf_rd2_forwarding_data,
        load_use_stall_flag
    );
    
    jump_stall_unit u_jump_stall_unit(
        if_id_inst_o,
        npc_op,
        jump_stall_flag
    );
   
    assign debug_wb_have_inst=mem_wb_rf_we_o|mem_wb_rf_re_o;
    assign debug_wb_pc=mem_wb_pc_o;
    assign debug_wb_ena=mem_wb_rf_we_o;
    assign debug_wb_reg=mem_wb_wright_reg_o;
    assign debug_wb_value=wright_back_wb_data;
endmodule
