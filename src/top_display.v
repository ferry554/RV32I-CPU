
module top_display(
    input fpga_clk,
    input fpga_rst,
    output wire led0_en,
    output wire led1_en,
    output wire led2_en,
    output wire led3_en,
    output wire led4_en,
    output wire led5_en,
    output wire led6_en,
    output wire led7_en,
    output wire led_ca ,
    output wire led_cb ,
    output wire led_cc ,
    output wire led_cd ,
    output wire led_ce ,
    output wire led_cf ,
    output wire led_cg ,
    output wire led_dp
    );
    
    wire clk_ip;
    wire lock;
    cpuclk u_clk(
        clk_ip,
        lock,
        fpga_clk
    );
    wire clk_2;
    
    divider_2 u_divider_2(
            fpga_clk,
            fpga_rst,
            clk_2
        );

    wire debug_wb_have_inst;
    wire [31:0] debug_wb_pc;
    wire debug_wb_ena;
    wire [4:0]debug_wb_reg;
    wire [31:0] debug_wb_value;
    wire [31:0] reg19_data;
    /*
    top u_top(
        clk_ip,
        fpga_rst,
        debug_wb_have_inst,
        debug_wb_pc,
        debug_wb_ena,
        debug_wb_reg,
        debug_wb_value,
        reg19_data
    );*/

    display u_display(
        clk_2,
        fpga_rst,
        reg19_data,
        led0_en,
        led1_en,
        led2_en,
        led3_en,
        led4_en,
        led5_en,
        led6_en,
        led7_en,
        led_ca ,
        led_cb ,
        led_cc ,
        led_cd ,
        led_ce ,
        led_cf ,
        led_cg ,
        led_dp
    );

endmodule
