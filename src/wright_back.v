//`timescale 1ns / 1ps


module wright_back(
    input [31:0]alu_result,
    input [31:0]dram_get,
    input [31:0]npc_pc4,
    input [1:0]cu_wd_sel,
    output reg [31:0]wrightback_data
    );
    always @(*) begin
        case (cu_wd_sel)
            2'b00:wrightback_data=alu_result;
            2'b01:wrightback_data=dram_get;
            2'b10:wrightback_data=npc_pc4;
            default:wrightback_data=32'b0;
        endcase
    end
    
    
endmodule
