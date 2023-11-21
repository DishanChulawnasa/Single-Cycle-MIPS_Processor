`timescale 1ns / 1ps
 
`include "Program_Counter.v"
`include "Adder.v"
`include "Instruction_Memory.v"
`include "MUX32.v"
`include "Register_File.v"
`include "Control.v"
`include "Sign_Extender.v"
`include "ALU_Control.v"
`include "ALU.v"
`include "Data_Memory.v"
`include "Shift_left2.v"
`include "Shift_left2_Jump.v"

module MIPS_Top(
        clock,
        reset
    );
    
    input clock, reset;
    
    wire [31:0] PC_i;
    wire [31:0] PC_o;
    wire [31:0] Adder_increment;
    wire [31:0] IncrAddress;
    wire [31:0] instruction;
    wire [31:0] WriteRegInputMUX_o;
    wire [31:0] Read_data1;
    wire [31:0] Read_data2;
    wire [31:0] SignExtendOutput;
    wire [31:0] ALUInputMUX_o;
    wire [31:0] ALUResult;
    wire [31:0] DataMemoryOutput;
    wire [31:0] write_data;
    wire [31:0] Adder2Input;
    wire [31:0] Adder2_o;
    wire [31:0] JumpAddress;
    wire [31:0] AdderOutMUX_o;
    
    wire [3:0] ALUControl_o;
    
    wire zero0;
    wire FourthMUXControl;
    
    wire RegDst;
    wire Jump;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    
    assign Adder_increment = (!reset) ? 32'd0 : 32'd4;
    assign FourthMUXControl = Branch & zero0;
    
    Program_Counter PC(
        .clock(clock),
        .reset(reset),
        .pc_i(PC_i),
        .pc_o(PC_o)  
    );
    
    Adder Adder_PC_4(
        .data1_i(PC_o),
        .data2_i(Adder_increment),
        .data_o(IncrAddress)
    );
    
    Instruction_Memory Instruction_Memory(
        .reset(reset),
        .instruction_address_i(PC_o),
        .instruction_o(instruction[31:0])
    );
    
    MUX4 WriteRegInputMUX(
        .data1_i(instruction[20:16]),
        .data2_i(instruction[15:11]),
        .MUX_control_i(RegDst),
        .data_o(WriteRegInputMUX_o)
    );
    
    Register_File Reg_File(
        .clock(clock),
        .reset(reset),
        .read_register1_i(instruction[25:21]),
        .read_register2_i(instruction[20:16]),
        .Write_enable_i(RegWrite),
        .write_register_i(WriteRegInputMUX_o),
        .write_data_i(write_data),
        .read_data1_o(Read_data1),
        .read_data2_o(Read_data2)        
    );
    
    Control Control_unit(
        .opcode_i(instruction[31:26]),
        .Jump_o(Jump),
        .RegDst_o(RegDst),
        .Branch_o(Branch),
        .MemRead_o(MemRead),
        .MemtoReg_o(MemtoReg),
        .ALUOp_o(ALUOp),
        .MemWrite_o(MemWrite),
        .ALUSrc_o(ALUSrc),
        .RegWrite_o(RegWrite)
    );
    
    Sign_Extender Sign_Extender(
        .instr16_i(instruction[15:0]),
        .instr32_o(SignExtendOutput)
    );
    
    MUX32 ALUInputMUX(
        .data1_i(Read_data2),
        .data2_i(SignExtendOutput),
        .MUX_control_i(ALUSrc),
        .data_o(ALUInputMUX_o)
    );
    
    ALU_Control ALU_Control(
        .reset(reset),
        .ALUOp_i(ALUOp),
        .Function_i(instruction[5:0]),
        .ALU_Control_o(ALUControl_o)
    );
    
    ALU ALU(
        .data1_i(Read_data1), 
        .data2_i(ALUInputMUX_o), 
        .ALU_Control_i(ALUControl_o), 
        .ALU_Result_o(ALUResult),
        .zero(zero0)    
    );
    
    Data_Memory Data_Memory(
        .clock(clock),
        .reset(reset),
        .address_i(ALUResult),
        .write_data_i(Read_data2),
        .Write_enable_i(MemRead),
        .Read_data_o(DataMemoryOutput)        
    );
    
    MUX32 DataMemoryOutMUX(
        .data1_i(ALUResult),
        .data2_i(DataMemoryOutput),
        .MUX_control_i(MemtoReg),
        .data_o(write_data)
    );
    
    Shift_left2 ShiftLeft2(
         .data_i(SignExtendOutput),
         .shift_amount_i(2'd2),
         .data_o(Adder2Input)
    );
    
    Adder Adder2(
        .data1_i(IncrAddress),
        .data2_i(Adder2Input),
        .data_o(Adder2_o)
    );
    
    MUX32 AdderOutMUX(
        .data1_i(IncrAddress),
        .data2_i(Adder2_o),
        .MUX_control_i(FourthMUXControl),
        .data_o(AdderOutMUX_o)
    );
    
    Shift_left2_Jump Shift_left2_Jump(
         .data_i(instruction[25:0]),
         .incrPC_i(IncrAddress),
         .data_o(JumpAddress)
    );
    
    MUX32 JumpMUX(
       .data1_i(AdderOutMUX_o),
       .data2_i(JumpAddress),
       .MUX_control_i(Jump),
       .data_o(PC_i) 
    );
    
    
    
endmodule
