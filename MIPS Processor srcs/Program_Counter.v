`timescale 1ns / 1ps

module Program_Counter(
          clock,
          reset,
          pc_i,
          pc_o  
    );
    
    input clock, reset;
    input [31:0] pc_i;
    output reg [31:0] pc_o;
    
    always @(posedge clock or negedge reset) begin
        if (!reset)
            pc_o <= 32'd0;
        else  
            pc_o <= pc_i;
    end     
    
endmodule
