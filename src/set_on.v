


module set_on(
    input sign,
    input [31:0]alu_a,
    input [31:0]alu_b,
    output reg [31:0] bool
    );
    wire [31:0]num;
    wire [32:0] unsign_numa,unsign_numb;
    wire [32:0] unsign_sub;

    assign unsign_numa={1'b0,alu_a};
    assign unsign_numb={1'b0,alu_b};    
    assign unsign_sub=unsign_numa+~unsign_numb+1;
    assign num=alu_a+~alu_b+1;
    
    always@(*)begin
        if(sign==0)begin
            bool=(unsign_sub[32]==1)?1:0;
        end
        else if(alu_a[31]==0&&alu_b[31]==1) begin
            bool=0;
        end
        else if(alu_a[31]==1&&alu_b[31]==0) begin
             bool=1;
         end
         else begin
            bool=(num[31]==1)?1:0;
         end
    end
endmodule
