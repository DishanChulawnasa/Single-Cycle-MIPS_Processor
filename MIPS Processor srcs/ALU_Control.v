`timescale 1ns / 1ps

module ALU_Control(
         reset,
         ALUOp_i,
         Function_i,
         ALU_Control_o
    );
    
    input reset;     
    input [1:0] ALUOp_i;
    input [5:0] Function_i;
    output reg [3:0] ALU_Control_o;
    
    always @(*) begin
        case(ALUOp_i)
            2'b00 : begin
                ALU_Control_o = 4'b0010; //add //LW //SW
            end
            2'b01 : begin
                ALU_Control_o = 4'b0110; //substract //Branch Equal
            end
            2'b10 : begin
                case(Function_i)
                    6'b100000 : begin
                        ALU_Control_o = 4'b0010; //add //R-type
                    end
                    6'b100010 : begin
                        ALU_Control_o = 4'b0110; //substract //R-type
                    end
                    6'b100100 : begin
                        ALU_Control_o = 4'b0000; //AND //R-type
                    end
                    6'b100101 : begin
                        ALU_Control_o = 4'b0001; //OR //R-type
                    end
                    6'b101010 : begin
                        ALU_Control_o = 4'b0111; //set on less than //R-type
                    end 
                    default : begin
                        ALU_Control_o = 4'b0110;
                    end                   
                endcase
                
            end
            
            default : begin
                ALU_Control_o = 4'b0110; 
            end
                                
        
        endcase
    
    end
    
    
    
endmodule
