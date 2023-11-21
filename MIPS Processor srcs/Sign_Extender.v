`timescale 1ns / 1ps

module Sign_Extender(
        instr16_i,
        instr32_o
    );
    
    input [15:0] instr16_i;
    output wire [31:0] instr32_o;
    
    assign instr32_o = {{16{instr16_i[15]}},instr16_i[15:0]};
    
endmodule
