`timescale 1ns / 1ps

module Shift_left2_Jump(
         data_i,
         incrPC_i,
         data_o
    );
    
    input [25:0] data_i;
    input [31:0] incrPC_i;
    
    output wire [31:0] data_o;
       
    assign data_o = {incrPC_i[31:28],data_i[25:0],{2{1'b0}}};    
    
endmodule
