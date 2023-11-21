`timescale 1ns / 1ps

module Shift_left2(
         data_i,
         shift_amount_i,
         data_o
    );
    
    input [31:0] data_i;
    input [1:0] shift_amount_i;
    output wire [31:0] data_o;
    
    assign data_o = data_i << shift_amount_i;
    
endmodule
