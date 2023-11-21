`timescale 1ns / 1ps

module MIPS_TOP_tb();
    reg clock = 1'b1;
    reg reset;
    
    MIPS_Top UUT(
        .clock(clock), 
        .reset(reset)
    );
    
    always begin
        clock = ~ clock;
        #5;  
        
    end 
    
    initial begin
        $dumpvars;    
        $dumpfile("dump.vcd");
    end
    
    initial begin
        reset = 1'b0;
        #15;

        reset =1'b1;
        #415;
        $finish;
    end
    

endmodule
