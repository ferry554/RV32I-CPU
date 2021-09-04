/* verilator lint_off TIMESCALEMOD */
//`timescale 1ns / 1ps



module regfile(
    input clk,
    input rst,
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] wright_reg,
    input [31:0] wright_data,
    input wright_en,
    output [31:0] read_data1,
    output [31:0] read_data2,
    output [31:0] reg19_data
    );
    wire [31:0] we_enable;
    
    wire [31:0] reg0_outdata;
    wire [31:0] reg1_outdata;
    wire [31:0] reg2_outdata;
    wire [31:0] reg3_outdata;
    wire [31:0] reg4_outdata;
    wire [31:0] reg5_outdata;
    wire [31:0] reg6_outdata;
    wire [31:0] reg7_outdata;
    wire [31:0] reg8_outdata;
    wire [31:0] reg9_outdata;
    wire [31:0] reg10_outdata;
    wire [31:0] reg11_outdata;
    wire [31:0] reg12_outdata;
    wire [31:0] reg13_outdata;
    wire [31:0] reg14_outdata;
    wire [31:0] reg15_outdata;
    wire [31:0] reg16_outdata;
    wire [31:0] reg17_outdata;
    wire [31:0] reg18_outdata;
    wire [31:0] reg19_outdata;
    wire [31:0] reg20_outdata;
    wire [31:0] reg21_outdata;
    wire [31:0] reg22_outdata;
    wire [31:0] reg23_outdata;
    wire [31:0] reg24_outdata;
    wire [31:0] reg25_outdata;
    wire [31:0] reg26_outdata;
    wire [31:0] reg27_outdata;
    wire [31:0] reg28_outdata;
    wire [31:0] reg29_outdata;
    wire [31:0] reg30_outdata;
    wire [31:0] reg31_outdata;
    
    wire [31:0]r1_out;
    wire [31:0]r2_out;
    
  
    decoder532 u_decoder532(wright_reg,wright_en,we_enable);
    reg_x0 u_reg32_0(clk,we_enable[0],wright_data,reg0_outdata);
    reg32 u_reg32_1(clk,rst,we_enable[1],wright_data,reg1_outdata);
    reg32 u_reg32_2(clk,rst,we_enable[2],wright_data,reg2_outdata);
    reg32 u_reg32_3(clk,rst,we_enable[3],wright_data,reg3_outdata);
    reg32 u_reg32_4(clk,rst,we_enable[4],wright_data,reg4_outdata);
    reg32 u_reg32_5(clk,rst,we_enable[5],wright_data,reg5_outdata);
    reg32 u_reg32_6(clk,rst,we_enable[6],wright_data,reg6_outdata);
    reg32 u_reg32_7(clk,rst,we_enable[7],wright_data,reg7_outdata);
    reg32 u_reg32_8(clk,rst,we_enable[8],wright_data,reg8_outdata);
    reg32 u_reg32_9(clk,rst,we_enable[9],wright_data,reg9_outdata);
    reg32 u_reg32_10(clk,rst,we_enable[10],wright_data,reg10_outdata);
    reg32 u_reg32_11(clk,rst,we_enable[11],wright_data,reg11_outdata);
    reg32 u_reg32_12(clk,rst,we_enable[12],wright_data,reg12_outdata);
    reg32 u_reg32_13(clk,rst,we_enable[13],wright_data,reg13_outdata);
    reg32 u_reg32_14(clk,rst,we_enable[14],wright_data,reg14_outdata);
    reg32 u_reg32_15(clk,rst,we_enable[15],wright_data,reg15_outdata);
    reg32 u_reg32_16(clk,rst,we_enable[16],wright_data,reg16_outdata);
    reg32 u_reg32_17(clk,rst,we_enable[17],wright_data,reg17_outdata);
    reg32 u_reg32_18(clk,rst,we_enable[18],wright_data,reg18_outdata);
    reg32 u_reg32_19(clk,rst,we_enable[19],wright_data,reg19_outdata);
    reg32 u_reg32_20(clk,rst,we_enable[20],wright_data,reg20_outdata);
    reg32 u_reg32_21(clk,rst,we_enable[21],wright_data,reg21_outdata);
    reg32 u_reg32_22(clk,rst,we_enable[22],wright_data,reg22_outdata);
    reg32 u_reg32_23(clk,rst,we_enable[23],wright_data,reg23_outdata);
    reg32 u_reg32_24(clk,rst,we_enable[24],wright_data,reg24_outdata);
    reg32 u_reg32_25(clk,rst,we_enable[25],wright_data,reg25_outdata);
    reg32 u_reg32_26(clk,rst,we_enable[26],wright_data,reg26_outdata);
    reg32 u_reg32_27(clk,rst,we_enable[27],wright_data,reg27_outdata);
    reg32 u_reg32_28(clk,rst,we_enable[28],wright_data,reg28_outdata);
    reg32 u_reg32_29(clk,rst,we_enable[29],wright_data,reg29_outdata);
    reg32 u_reg32_30(clk,rst,we_enable[30],wright_data,reg30_outdata);
    reg32 u_reg32_31(clk,rst,we_enable[31],wright_data,reg31_outdata);   
    regfile_multiplexer u_regfile_multiplexer_1(
     reg0_outdata,
     reg1_outdata,
     reg2_outdata,
     reg3_outdata,
     reg4_outdata,
     reg5_outdata,
     reg6_outdata,
     reg7_outdata,
     reg8_outdata,
     reg9_outdata,
     reg10_outdata,
     reg11_outdata,
     reg12_outdata,
     reg13_outdata,
     reg14_outdata,
     reg15_outdata,
     reg16_outdata,
     reg17_outdata,
     reg18_outdata,
     reg19_outdata,
     reg20_outdata,
     reg21_outdata,
     reg22_outdata,
     reg23_outdata,
     reg24_outdata,
     reg25_outdata,
     reg26_outdata,
     reg27_outdata,
     reg28_outdata,
     reg29_outdata,
     reg30_outdata,
     reg31_outdata,
     read_reg1,
     r1_out
    );
    regfile_multiplexer u_regfile_multiplexer_2(
     reg0_outdata,
     reg1_outdata,
     reg2_outdata,
     reg3_outdata,
     reg4_outdata,
     reg5_outdata,
     reg6_outdata,
     reg7_outdata,
     reg8_outdata,
     reg9_outdata,
     reg10_outdata,
     reg11_outdata,
     reg12_outdata,
     reg13_outdata,
     reg14_outdata,
     reg15_outdata,
     reg16_outdata,
     reg17_outdata,
     reg18_outdata,
     reg19_outdata,
     reg20_outdata,
     reg21_outdata,
     reg22_outdata,
     reg23_outdata,
     reg24_outdata,
     reg25_outdata,
     reg26_outdata,
     reg27_outdata,
     reg28_outdata,
     reg29_outdata,
     reg30_outdata,
     reg31_outdata,
     read_reg2,
     r2_out
        );

    
     assign read_data1=r1_out;
     assign read_data2=r2_out;
     assign reg19_data=reg19_outdata;
    
endmodule
/* verilator lint_on TIMESCALEMOD */
