
`ifndef CPU_PARAM
`define CPU_PARAM
    
    
    `define add 'b0000
    `define sub 'b0001
    `define logic_and 'b0010
    `define logic_or 'b0011
    `define logic_xor 'b0100
    `define sll 'b0101
    `define srl 'b0110
    `define sra 'b0111
    `define slt 'b1000
    `define sltu 'b1001
    
    `define I 'b000
    `define S 'b001
    `define B 'b010
    `define J 'b011
    `define U 'b100
    
    
    
    
    
    // syntax: `define <macro name> <parameter>
    `define LW      'b0000011
    `define I_type     'b0010011
    `define ADDI 'b000
    `define SLLI 'b001
    `define SLTI 'b010
    `define SLTUI 'b011
    `define XORI 'b100
    `define I_rightshift 'b101
    `define SRLI 'b0000000
    `define SRAI 'b0100000
    `define ORI 'b110
    `define ANDI 'b111
    `define SW      'b0100011
    `define R_type     'b0110011
    `define R_algo 'b000
    `define ADD 'b0000000
    `define SUB 'b0100000
    `define SLL 'b001
    `define SLT 'b010
    `define SLTU 'b011
    `define XOR 'b100
    `define R_rightshift 'b101
    `define SRL 'b0000000
    `define SRA 'b0100000
    `define OR 'b110
    `define AND 'b111
    `define LUI 'b0110111
    `define AUIPC 'b0010111
    `define B_type 'b1100011
    `define BEQ 'b000
    `define BNE 'b001
    `define BLT 'b100
    `define BGE 'b101
    `define BLTU 'b110
    `define BGEU 'b111
    `define JARL 'b1100111
    `define JAL 'b1101111

`endif

//module param();
//endmodule


