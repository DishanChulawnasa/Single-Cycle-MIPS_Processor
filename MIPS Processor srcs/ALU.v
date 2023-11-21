`timescale 1ns / 1ps

module ALU(
            data1_i, 
            data2_i, 
            ALU_Control_i, 
            ALU_Result_o,
            zero
    );
            
    input [31:0] data1_i,data2_i;
    input [3:0] ALU_Control_i;
    
    output reg [31:0] ALU_Result_o;
    output wire zero;
    
    assign zero = !(|ALU_Result_o);
    
    always@(*)begin
        case(ALU_Control_i)
              //add
              4'b0010 : begin
                ALU_Result_o = data1_i + data2_i;
              end
              //substract
              4'b0110 : begin
                ALU_Result_o = data1_i - data2_i;
              end
              //AND
              4'b0000 : begin
                ALU_Result_o = data1_i & data2_i;
              end
              //OR
              4'b0001 : begin
                ALU_Result_o = data1_i | data2_i;
              end
              //set on less than
              4'b0111 : begin
                if (data1_i < data2_i)
                    ALU_Result_o = 32'd1;
                else
                    ALU_Result_o = 32'd0;
              end
              default : begin
                ALU_Result_o = data1_i + data2_i;
              end        
        endcase    
        
    end

endmodule 