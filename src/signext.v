//`timescale 1ns / 1ps
`include "param.v"


module signext(
    input [24:0]din,
    input [2:0] sext_op,
    output reg [31:0]ext
    );
    always @(*) begin
        case (sext_op)
            `I:begin//I
                if (din[24]==1) begin
                    ext={20'hfffff,din[24:13]};
                end
                else begin
                    ext={20'b0,din[24:13]};
                end
            end
            `S:begin//S                
                if (din[24]==1) begin
                    ext={20'hfffff,din[24:18],din[4:0]};
                end
                else begin
                    ext={20'b0,din[24:18],din[4:0]};
                end
            end
            `B:begin//B
                if (din[24]==1) begin
                    ext={19'h7ffff,din[24],din[0],din[23:18],din[4:1],1'b0};
                end
                else begin
                    ext={19'b0,din[24],din[0],din[23:18],din[4:1],1'b0};
                end
            end
            `J:begin//J            
                if (din[24]==1) begin
                    ext={11'h7ff,din[24],din[12:5],din[13],din[23:14],1'b0};
                end
                else begin
                    ext={11'b0,din[24],din[12:5],din[13],din[23:14],1'b0};
                end                
            end
            `U:begin//U
                ext={din[24:5],12'b0};
            end 
            default:ext=32'b0; 
        endcase
    end
endmodule
