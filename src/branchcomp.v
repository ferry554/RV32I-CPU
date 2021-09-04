//`timescale 1ns / 1ps


module branchcomp(
    input [31:0] rdata1,
    input [31:0] rdata2,
    input br_un,
    output wire br_eq,
    output reg br_lt
    );
    wire [31:0]sub;   
    wire [32:0] unsign_numa,unsign_numb;
    wire [32:0] unsign_sub;   
    assign sub=rdata1+~rdata2+1;
    
    assign br_eq=(sub==0)?1:0;
 
    assign unsign_numa={1'b0,rdata1};
    assign unsign_numb={1'b0,rdata2};    
    assign unsign_sub=unsign_numa+~unsign_numb+1;
   
    always@(*)begin
        if(br_un==1)begin
            br_lt=(unsign_sub[32]==1)?1:0;
        end
        else if(rdata1[31]==0&&rdata2[31]==1) begin
            br_lt=0;
        end
        else if(rdata1[31]==1&&rdata2[31]==0) begin
             br_lt=1;
         end
         else begin
            br_lt=(sub[31]==1)?1:0;
         end
    end
endmodule

    
