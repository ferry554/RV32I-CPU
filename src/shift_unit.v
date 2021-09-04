//`timescale 1ns / 1ps


module shift_unit(
    input [31:0] a,
    input [31:0] b,
    input [1:0] shift_choose,
    output reg [31:0] shift_result
    );
    wire [6:0] shift_sel;
    assign shift_sel={shift_choose[1:0],b[4:0]};
    always @(*) begin
        case (shift_sel)
            7'h00:shift_result={a[31:0]};
            7'h01:shift_result={a[30:0],1'b0};
            7'h02:shift_result={a[29:0],2'b0};
            7'h03:shift_result={a[28:0],3'b0};
            7'h04:shift_result={a[27:0],4'b0};
            7'h05:shift_result={a[26:0],5'b0};
            7'h06:shift_result={a[25:0],6'b0};
            7'h07:shift_result={a[24:0],7'b0};
            7'h08:shift_result={a[23:0],8'b0};
            7'h09:shift_result={a[22:0],9'b0};
            7'h0a:shift_result={a[21:0],10'b0};
            7'h0b:shift_result={a[20:0],11'b0};
            7'h0c:shift_result={a[19:0],12'b0};
            7'h0d:shift_result={a[18:0],13'b0};
            7'h0e:shift_result={a[17:0],14'b0};
            7'h0f:shift_result={a[16:0],15'b0};
            7'h10:shift_result={a[15:0],16'b0}; 
            7'h11:shift_result={a[14:0],17'b0};
            7'h12:shift_result={a[13:0],18'b0};
            7'h13:shift_result={a[12:0],19'b0};
            7'h14:shift_result={a[11:0],20'b0};
            7'h15:shift_result={a[10:0],21'b0};
            7'h16:shift_result={a[9:0],22'b0};
            7'h17:shift_result={a[8:0],23'b0};
            7'h18:shift_result={a[7:0],24'b0};
            7'h19:shift_result={a[6:0],25'b0};
            7'h1a:shift_result={a[5:0],26'b0};
            7'h1b:shift_result={a[4:0],27'b0};
            7'h1c:shift_result={a[3:0],28'b0};
            7'h1d:shift_result={a[2:0],29'b0};
            7'h1e:shift_result={a[1:0],30'b0};
            7'h1f:shift_result={a[0],31'b0};
            7'h20:shift_result={a[31:0]}; 
            7'h21:shift_result={1'b0,a[31:1]};
            7'h22:shift_result={2'b0,a[31:2]};
            7'h23:shift_result={3'b0,a[31:3]};
            7'h24:shift_result={4'b0,a[31:4]};
            7'h25:shift_result={5'b0,a[31:5]};
            7'h26:shift_result={6'b0,a[31:6]};
            7'h27:shift_result={7'b0,a[31:7]};
            7'h28:shift_result={8'b0,a[31:8]};
            7'h29:shift_result={9'b0,a[31:9]};
            7'h2a:shift_result={10'b0,a[31:10]};
            7'h2b:shift_result={11'b0,a[31:11]};
            7'h2c:shift_result={12'b0,a[31:12]};
            7'h2d:shift_result={13'b0,a[31:13]};
            7'h2e:shift_result={14'b0,a[31:14]};
            7'h2f:shift_result={15'b0,a[31:15]};
            7'h30:shift_result={16'b0,a[31:16]}; 
            7'h31:shift_result={17'b0,a[31:17]};
            7'h32:shift_result={18'b0,a[31:18]};
            7'h33:shift_result={19'b0,a[31:19]};
            7'h34:shift_result={20'b0,a[31:20]};
            7'h35:shift_result={21'b0,a[31:21]};
            7'h36:shift_result={22'b0,a[31:22]};
            7'h37:shift_result={23'b0,a[31:23]};
            7'h38:shift_result={24'b0,a[31:24]};
            7'h39:shift_result={25'b0,a[31:25]};
            7'h3a:shift_result={26'b0,a[31:26]};
            7'h3b:shift_result={27'b0,a[31:27]};
            7'h3c:shift_result={28'b0,a[31:28]};
            7'h3d:shift_result={29'b0,a[31:29]};
            7'h3e:shift_result={30'b0,a[31:30]};
            7'h3f:shift_result={31'b0,a[31]};
            7'h40:shift_result={a[31:0]}; 
            7'h41:begin
                if (a[31]==0) begin
                    shift_result={1'b0,a[31:1]};
                end
                else begin
                    shift_result={1'h1,a[31:1]};
                end
            end
            7'h42:begin
                if (a[31]==0) begin
                    shift_result={2'b0,a[31:2]};
                end
                else begin
                    shift_result={2'h3,a[31:2]};
                end
            end
            7'h43:begin
                if (a[31]==0) begin
                    shift_result={3'b0,a[31:3]};
                end
                else begin
                    shift_result={3'h7,a[31:3]};
                end
            end
            7'h44:begin
                if (a[31]==0) begin
                    shift_result={4'b0,a[31:4]};
                end
                else begin
                    shift_result={4'hf,a[31:4]};
                end
            end
            7'h45:begin
                if (a[31]==0) begin
                    shift_result={5'b0,a[31:5]};
                end
                else begin
                    shift_result={5'h1f,a[31:5]};
                end
            end
            7'h46:begin
                if (a[31]==0) begin
                    shift_result={6'b0,a[31:6]};
                end
                else begin
                    shift_result={6'h3f,a[31:6]};
                end
            end
            7'h47:begin
                if (a[31]==0) begin
                    shift_result={7'b0,a[31:7]};
                end
                else begin
                    shift_result={7'h7f,a[31:7]};
                end
            end
            7'h48:begin
                if (a[31]==0) begin
                    shift_result={8'b0,a[31:8]};
                end
                else begin
                    shift_result={8'hff,a[31:8]};
                end
            end
            7'h49:begin
                if (a[31]==0) begin
                    shift_result={9'b0,a[31:9]};
                end
                else begin
                    shift_result={9'h1ff,a[31:9]};
                end
            end
            7'h4a:begin
                if (a[31]==0) begin
                    shift_result={10'b0,a[31:10]};
                end
                else begin
                    shift_result={10'h3ff,a[31:10]};
                end
            end
            7'h4b:begin
                if (a[31]==0) begin
                    shift_result={11'b0,a[31:11]};
                end
                else begin
                    shift_result={11'h7ff,a[31:11]};
                end
            end
            7'h4c:begin
                if (a[31]==0) begin
                    shift_result={12'b0,a[31:12]};
                end
                else begin
                    shift_result={12'hfff,a[31:12]};
                end
            end
            7'h4d:begin
                if (a[31]==0) begin
                    shift_result={13'b0,a[31:13]};
                end
                else begin
                    shift_result={13'h1fff,a[31:13]};
                end
            end
            7'h4e:begin
                if (a[31]==0) begin
                    shift_result={14'b0,a[31:14]};
                end
                else begin
                    shift_result={14'h3fff,a[31:14]};
                end
            end
            7'h4f:begin
                if (a[31]==0) begin
                    shift_result={15'b0,a[31:15]};
                end
                else begin
                    shift_result={15'h7fff,a[31:15]};
                end
            end
            7'h50:begin
                if (a[31]==0) begin
                    shift_result={16'b0,a[31:16]};
                end
                else begin
                    shift_result={16'hffff,a[31:16]};
                end
            end
            7'h51:begin
               if (a[31]==0) begin
                    shift_result={17'b0,a[31:17]};
                end
                else begin
                    shift_result={17'h1ffff,a[31:17]};
                end 
            end
            7'h52:begin
                if (a[31]==0) begin
                    shift_result={18'b0,a[31:18]};
                end
                else begin
                    shift_result={18'h3ffff,a[31:18]};
                end
            end
            7'h53:begin
                if (a[31]==0) begin
                    shift_result={19'b0,a[31:19]};
                end
                else begin
                    shift_result={19'h7ffff,a[31:19]};
                end
            end
            7'h54:begin
                if (a[31]==0) begin
                    shift_result={20'b0,a[31:20]};
                end
                else begin
                    shift_result={20'hfffff,a[31:20]};
                end
            end
            7'h55:begin
               if (a[31]==0) begin
                    shift_result={21'b0,a[31:21]};
                end
                else begin
                    shift_result={21'h1fffff,a[31:21]};
                end 
            end
            7'h56:begin
                if (a[31]==0) begin
                    shift_result={22'b0,a[31:22]};
                end
                else begin
                    shift_result={22'h3fffff,a[31:22]};
                end
            end
            7'h57:begin
               if (a[31]==0) begin
                    shift_result={23'b0,a[31:23]};
                end
                else begin
                    shift_result={23'h7fffff,a[31:23]};
                end 
            end
            7'h58:begin
               if (a[31]==0) begin
                    shift_result={24'b0,a[31:24]};
                end
                else begin
                    shift_result={24'hffffff,a[31:24]};
                end 
            end
            7'h59:begin
               if (a[31]==0) begin
                    shift_result={25'b0,a[31:25]};
                end
                else begin
                    shift_result={25'h1ffffff,a[31:25]};
                end 
            end
            7'h5a:begin
               if (a[31]==0) begin
                    shift_result={26'b0,a[31:26]};
                end
                else begin
                    shift_result={26'h3ffffff,a[31:26]};
                end 
            end
            7'h5b:begin
                if (a[31]==0) begin
                    shift_result={27'b0,a[31:27]};
                end
                else begin
                    shift_result={27'h7ffffff,a[31:27]};
                end
            end
            7'h5c:begin
                if (a[31]==0) begin
                    shift_result={28'b0,a[31:28]};
                end
                else begin
                    shift_result={28'hfffffff,a[31:28]};
                end
            end
            7'h5d:begin
               if (a[31]==0) begin
                    shift_result={29'b0,a[31:29]};
                end
                else begin
                    shift_result={29'h1fffffff,a[31:29]};
                end 
            end
            7'h5e:begin
                if (a[31]==0) begin
                    shift_result={30'b0,a[31:30]};
                end
                else begin
                    shift_result={30'h3fffffff,a[31:30]};
                end
            end
            7'h5f:begin
                if (a[31]==0) begin
                    shift_result={31'b0,a[31]};
                end
                else begin
                    shift_result={31'h7fffffff,a[31]};
                end
            end
            default:shift_result=32'b0; 
        endcase
    end
endmodule
