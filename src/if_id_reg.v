


module if_id_reg(
    input clk,
    input rst,
    input load_use_stall_flag,
    input jump_stall_flag,
    input [31:0] pc_i,
    input [31:0] pc4_i,
    input [31:0] inst_i,
    output reg [31:0] pc_o,
    output reg [31:0] pc4_o,
    output reg[31:0] inst_o
    );
    always @(posedge clk) begin
        if(rst==0)begin
        pc_o<=32'b0;
        pc4_o<=32'b0;
        inst_o<=32'b0;
        end
     
        else if (load_use_stall_flag==1) begin
            pc_o<=pc_o;
            pc4_o<=pc4_o;
            inst_o<=inst_o;
        end
    
        else if (jump_stall_flag==1) begin
            pc_o<=32'b0;
            pc4_o<=32'b0;
            inst_o<=32'b0;
        end
        
        else begin
            pc_o<=pc_i;
            pc4_o<=pc4_i;
            inst_o<=inst_i;
        end
    end
    /*
     reg [2:0] cnt;
       
       
       
   
       always @(posedge clk) begin
       if (rst==0) begin 
               cnt<=0;
              end
         else  if (stall_flag==1) begin
               //cnt<=(cnt==0)?0:cnt-1;
               cnt<=stall_cycle_num;
           end
           else begin
                           cnt<=(cnt==0)?0:cnt-1;
                      end
        
       end

    always @(posedge clk) begin
        if (rst==0) begin
            pc_o<=32'b0;
            pc4_o<=32'b0;
            inst_o<=32'b0;
        end
        else if (cnt==0&&stall_flag==0) begin
            pc_o<=pc_i;
            pc4_o<=pc4_i;
            inst_o<=inst_i;
        end
        else if (cnt==0&&stall_flag==1) begin
        
           pc_o<=(cnt==0)?pc_i:pc_o;
            pc4_o<=(cnt==0)?pc4_i:pc4_o;
            inst_o<=(cnt==0)?inst_i:inst_o;
            pc_o<=pc_o;
                        pc4_o<=pc4_o;
                        inst_o<=inst_o;
        end
    end*/


    
endmodule
