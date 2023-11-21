`timescale 1ns / 1ps

module Instruction_Memory(
            reset,
            instruction_address_i,
            instruction_o
        );
    
    input reset;
    input [31:0] instruction_address_i;
    output wire [31:0] instruction_o;
    
    reg [31:0] instruction_memory [1023:0];
    
    initial begin
        $readmemh("instruction_memory.mem", instruction_memory);
    end
    
    assign instruction_o = (~reset) ? {32{1'b0}} : instruction_memory[instruction_address_i[31:2]];
                            
    
endmodule
