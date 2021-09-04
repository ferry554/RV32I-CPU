//`timescale 1ns / 1ps


module PC(
    input clk,
    input rst,
    input load_use_stall_flag,
    input [31:0] din,
    output reg [31:0]pc
    );
     reg [2:0] cnt;
     /*
     reg flag1;
     reg flag2;
     reg falg3;
     
     always @(posedge clk) begin
        if(rst==0)begin
            flag1=0;
            flag2=0;
            flag3=0;
        end
        else if (stall_cycle_num==1) begin
            flag1=1;
            flag2=0;
            flag3=0;
        end
        if
     end*/
       
       /*
       always @(posedge stall_flag) begin
           cnt<=stall_cycle_num;
       end*/
   /*
       always @(posedge clk) begin
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
            if (rst==0) begin
                pc<=32'hfffffffc;
                //pc<=32'b0;
            end  
            else if(load_use_stall_flag==1)begin
                pc<=pc;
            end 
            else begin
                pc<=din;
            end 
            end        
            //else if (cnt==0&&stall_flag==0) begin
                //pc<=din;
            //end
            //else if (cnt==0&&stall_flag==1)begin
               //pc<=pc;
               //pc<=pc;
            //end
     //end
    /*
    reg [2:0] cnt;
    
    
    always @(posedge stall_flag) begin
        cnt<=stall_cycle_num;
    end

    always @(posedge clk) begin
        if (stall_flag==1) begin
            cnt<=(cnt==0)?0:cnt-1;
        end
    end

    always @(posedge clk) begin
        if (rst==0) begin
            pc<=32'hfffffffc;
        end            
        else if (stall_flag==0) begin
            pc<=din;
        end
        else if (stall_flag==1)begin
            pc<=(cnt==0)?din:pc;
        end
    end*/

endmodule
