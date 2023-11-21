`timescale 1ns / 1ps

module Control(
        opcode_i,
        RegDst_o,
        Jump_o,
        Branch_o,
        MemRead_o,
        MemtoReg_o,
        ALUOp_o,
        MemWrite_o,
        ALUSrc_o,
        RegWrite_o
    );
    
    input [5:0] opcode_i;
    output wire [1:0] ALUOp_o;
    output wire RegDst_o,
                Jump_o,
                Branch_o, 
                MemRead_o, 
                MemtoReg_o, 
                MemWrite_o, 
                ALUSrc_o, 
                RegWrite_o;    
    
    assign RegDst_o = (opcode_i == 6'b000000) ? 1'b1 : 1'b0 ;
    assign Jump_o = (opcode_i == 6'b000010)? 1'b1 : 1'b0 ;
    assign Branch_o = (opcode_i == 6'b000100) ? 1'b1 : 1'b0 ; 
    assign MemRead_o = (opcode_i == 6'b100011) ? 1'b1 : 1'b0 ;
    assign MemtoReg_o = (opcode_i == 6'b100011) ? 1'b1 : 1'b0 ;
    assign ALUOp_o = (opcode_i == 6'b000000) ? 2'b10 : (opcode_i == 6'b000100) ? 2'b01 : 2'b00;
    assign MemWrite_o = (opcode_i == 6'b101011) ? 1'b1 : 1'b0 ;
    assign ALUSrc_o = ((opcode_i == 6'b100011)|(opcode_i == 6'b101011)) ? 1'b1 : 1'b0 ;
    assign RegWrite_o = ((opcode_i == 6'b000000)|(opcode_i == 6'b100011)) ? 1'b1 : 1'b0 ;
    
endmodule
