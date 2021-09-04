//`timescale 1ns / 1ps


module regfile_multiplexer(
    input [31:0]reg0,
    input [31:0]reg1,
    input [31:0]reg2,
    input [31:0]reg3,
    input [31:0]reg4,
    input [31:0]reg5,
    input [31:0]reg6,
    input [31:0]reg7,
    input [31:0]reg8,
    input [31:0]reg9,
    input [31:0]reg10,
    input [31:0]reg11,
    input [31:0]reg12,
    input [31:0]reg13,
    input [31:0]reg14,
    input [31:0]reg15,
    input [31:0]reg16,
    input [31:0]reg17,
    input [31:0]reg18,
    input [31:0]reg19,
    input [31:0]reg20, 
    input [31:0]reg21,
    input [31:0]reg22,
    input [31:0]reg23,
    input [31:0]reg24,
    input [31:0]reg25,
    input [31:0]reg26,
    input [31:0]reg27,
    input [31:0]reg28,
    input [31:0]reg29,
    input [31:0]reg30,
    input [31:0]reg31,   
    input [4:0]read_reg,
    output reg [31:0] read_data
    );
    always @(*) begin
        case (read_reg)
            5'b00000: read_data = reg0;
            5'b00001: read_data = reg1;
            5'b00010: read_data = reg2;           
            5'b00011: read_data = reg3;              
            5'b00100: read_data = reg4;             
            5'b00101: read_data = reg5;             
            5'b00110: read_data = reg6;             
            5'b00111: read_data = reg7;
            5'b01000: read_data = reg8;
            5'b01001: read_data = reg9;
            5'b01010: read_data = reg10;           
            5'b01011: read_data = reg11;             
            5'b01100: read_data = reg12;              
            5'b01101: read_data = reg13;             
            5'b01110: read_data = reg14;             
            5'b01111: read_data = reg15;
            5'b10000: read_data = reg16;
            5'b10001: read_data = reg17;
            5'b10010: read_data = reg18;            
            5'b10011: read_data = reg19;             
            5'b10100: read_data = reg20;            
            5'b10101: read_data = reg21;             
            5'b10110: read_data = reg22;           
            5'b10111: read_data = reg23;
            5'b11000: read_data = reg24;
            5'b11001: read_data = reg25;
            5'b11010: read_data = reg26;           
            5'b11011: read_data = reg27;            
            5'b11100: read_data = reg28;            
            5'b11101: read_data = reg29;             
            5'b11110: read_data = reg30;              
            5'b11111: read_data = reg31; 
            default: read_data = 32'b0;
        endcase
    end

endmodule
