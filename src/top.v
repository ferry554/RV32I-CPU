
//`timescale 1ns / 1ps


module top(
    input clk,
    input rst_n,
    output        debug_wb_have_inst,   
    output [31:0] debug_wb_pc,         
    output        debug_wb_ena,         
    output [4:0]  debug_wb_reg,         
    output [31:0] debug_wb_value        
    
    );
    
    wire [31:0]inst;
    wire [31:0] data_to_cpu;
    wire [31:0]inst_addr;
    wire [31:0]dram_get_data;
    wire [31:0]dram_wright_addr;
    wire [31:0]dram_wright_data;
    wire dram_we;
    
    cpu u_cpu(
        clk,
        rst_n,
        inst,
        dram_get_data,
        inst_addr,
        dram_wright_addr,
        dram_wright_data,
        dram_we,
        
        debug_wb_have_inst,
        debug_wb_pc,
        debug_wb_ena, 
        debug_wb_reg, 
        debug_wb_value 
    );
  
    wire [13:0] instruction_addr={inst_addr[15:2]};
    wire [13:0] data_addr={dram_wright_addr[15:2]};

    prgrom u_irom (
        instruction_addr,  
        inst   
    );
    
    
    dram u_dram (
            data_addr,
            dram_wright_data,
            clk,      
            //data_addr,     
            dram_we,  
            //dram_wright_data,  
            dram_get_data
    );

endmodule
