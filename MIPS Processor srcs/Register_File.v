`timescale 1ns / 1ps

module Register_File(
        clock,
        reset,
        read_register1_i,
        read_register2_i,
        Write_enable_i,
        write_register_i,
        write_data_i,
        read_data1_o,
        read_data2_o
    );
    
    input clock, reset;
    input [4:0] read_register1_i;
    input [4:0] read_register2_i;
    input Write_enable_i;
    input [4:0] write_register_i;
    input [31:0] write_data_i;
    
    output wire [31:0] read_data1_o;
    output wire [31:0] read_data2_o; 
    
    reg [31:0] Registers [31:0];
    
    initial begin
        $readmemh("reg_memory.mem",Registers);
    end
    
    assign read_data1_o = (~reset) ? 32'd0 : Registers[read_register1_i];
    assign read_data2_o = (~reset) ? 32'd0 : Registers[read_register2_i];
    
    always @ (posedge clock)
    begin
        if (Write_enable_i)
            Registers[write_register_i] <= write_data_i;
    end 
    
endmodule
