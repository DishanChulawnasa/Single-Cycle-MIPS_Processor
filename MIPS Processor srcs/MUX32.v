`timescale 1ns / 1ps

module MUX32(
        data1_i,
        data2_i,
        MUX_control_i,
        data_o
    );
    
    input [31:0] data1_i, data2_i;
    input MUX_control_i;
    
    output wire [31:0] data_o;
    
    assign data_o = MUX_control_i ? data2_i : data1_i;
    
endmodule
