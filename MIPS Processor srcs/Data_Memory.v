`timescale 1ns / 1ps

module Data_Memory(
        clock,
        reset,
        address_i,
        write_data_i,
        Write_enable_i,
        Read_data_o
    );
    
    input clock,reset;
    input [31:0] address_i;
    input [31:0] write_data_i;
    input Write_enable_i;
    
    output wire [31:0] Read_data_o;
    
    reg [31:0] dataMemory [1023:0];
    
    initial begin 
        $readmemh("data_memory.mem", dataMemory);
    end
    
    assign Read_data_o = (~reset) ? 32'd0 : dataMemory[address_i];
                          
    
    always @ (posedge clock)
    begin
        if (Write_enable_i)
            dataMemory[address_i] <= write_data_i;
    end
    
endmodule
