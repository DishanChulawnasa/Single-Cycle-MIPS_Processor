# Single-Cycle-MIPS_Processor

Designed a single clock cycle MIPS Processor by Verilog HDL. 

Basic modules: Program Counter, Adder, Instruction Memory, Register File, Control Unit, Sign Extender, ALU, ALU Control Unit, Data Memory, Bit Shifter, Jump Shifter, 32 bit 2:1 Multiplexer, 5 bit 2:1 Multiplexer
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/4eae7a91-7a05-40bf-abcd-f93c855e55eb)

MIPS instructions: lw, sw, beq, bne, add, sub, set less than, jump 
ALU Control:
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/b459ce92-7741-40cf-bde8-ba474a28551e)

Control:
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/f934e014-b1cb-4cf9-aadd-2d238df6b0fb)
*Jump also included. when Opcode = 000010, Jump = 1, Otherwise Jump = 0.

Effect of Control Signals
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/cf1efbd8-9907-4eed-bd33-821a7b561cf1)
*Jump Effect when deasserted: None
*Jump Effect when asserted: concatenating the upper 4 bits of the current PC + 4 to the 26-bit address fi eld in the jump instruction and adding 00 as the 2 low-order bits.

RTL Schematic of MIPS Processor (Xilinx Vivado):
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/a904a57d-e8cf-42c7-b470-7847bee7681c)
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/c1322f6b-4c09-41a2-8a01-7e2d2829fa80)


Simulation:
1.	Add two Numbers:
MIPS Emulator:
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/11689b33-6dfb-4481-bbf8-ba365c1f9422)

Simulation in Xilinx Vivado (MIPS_TOP_tb_behav.wcfg):
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/dd73d2a6-99ef-44cb-9086-98bcccfc9993)

2.	Fibonachchi Numbers:	
MIPS Emulator:
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/b9101bfb-c8e3-4e06-82c1-797a55916f91)

Simulation in Xilinx Vivado (MIPS_TOP_tb_behav.wcfg):
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/069f4ec7-4745-4a88-93bf-a7bdf5f2a3dd)
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/5ec11ad7-1e3e-4841-89a6-c808f5b33c7d)
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/8f11929e-beb9-4941-a4eb-1f40b90e866a)
