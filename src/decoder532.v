//`timescale 1ns / 1ps


module decoder532(
    input [4:0] wright_reg,
    input wright_en,        
    output reg [31:0] choose_reg
    );
    always @(*) begin   
        if(wright_en==1)begin                  
            case (wright_reg) 
            5'b00000: choose_reg = {31'b0,1'b1};
            5'b00001: choose_reg = {30'b0,1'b1,1'b0};
            5'b00010: choose_reg = {29'b0,1'b1,2'b0};             
            5'b00011: choose_reg = {28'b0,1'b1,3'b0};              
            5'b00100: choose_reg = {27'b0,1'b1,4'b0};              
            5'b00101: choose_reg = {26'b0,1'b1,5'b0};              
            5'b00110: choose_reg = {25'b0,1'b1,6'b0};              
            5'b00111: choose_reg = {24'b0,1'b1,7'b0};
            5'b01000: choose_reg = {23'b0,1'b1,8'b0};
            5'b01001: choose_reg = {22'b0,1'b1,9'b0};
            5'b01010: choose_reg = {21'b0,1'b1,10'b0};             
            5'b01011: choose_reg = {20'b0,1'b1,11'b0};              
            5'b01100: choose_reg = {19'b0,1'b1,12'b0};              
            5'b01101: choose_reg = {18'b0,1'b1,13'b0};              
            5'b01110: choose_reg = {17'b0,1'b1,14'b0};              
            5'b01111: choose_reg = {16'b0,1'b1,15'b0};
            5'b10000: choose_reg = {15'b0,1'b1,16'b0};
            5'b10001: choose_reg = {14'b0,1'b1,17'b0};
            5'b10010: choose_reg = {13'b0,1'b1,18'b0};             
            5'b10011: choose_reg = {12'b0,1'b1,19'b0};              
            5'b10100: choose_reg = {11'b0,1'b1,20'b0};              
            5'b10101: choose_reg = {10'b0,1'b1,21'b0};              
            5'b10110: choose_reg = {9'b0,1'b1,22'b0};              
            5'b10111: choose_reg = {8'b0,1'b1,23'b0};
            5'b11000: choose_reg = {7'b0,1'b1,24'b0};
            5'b11001: choose_reg = {6'b0,1'b1,25'b0};
            5'b11010: choose_reg = {5'b0,1'b1,26'b0};             
            5'b11011: choose_reg = {4'b0,1'b1,27'b0};              
            5'b11100: choose_reg = {3'b0,1'b1,28'b0};              
            5'b11101: choose_reg = {2'b0,1'b1,29'b0};              
            5'b11110: choose_reg = {1'b0,1'b1,30'b0};              
            5'b11111: choose_reg = {1'b1,31'b0};
            default:choose_reg=32'b0;
            endcase
          end 
          else begin
            choose_reg=32'b0;
          end   
    end
    
endmodule
