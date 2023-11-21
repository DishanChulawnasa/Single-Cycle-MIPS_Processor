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

![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/e0d3c9ed-868e-454b-94fe-129818c0ba36)




Simulation in Xilinx Vivado (MIPS_TOP_tb_behav.wcfg):

![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/12ef1b1f-bcac-4529-a9d5-8ad25fca1c86)
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/693d5d77-6ac8-4b74-98e5-1a59c1773065)
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/77d07ca7-dac1-492f-9570-e2e55781b944)



2.	Fibonachchi Numbers:	
MIPS Emulator:

![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/00709adc-d451-4560-aa07-f1c143f33035)



Simulation in Xilinx Vivado (MIPS_TOP_tb_behav.wcfg):

![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/b5c90a85-e693-4a91-b991-b46fe42f03b4)
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/7600a2c2-d64f-41f4-b7cd-1602dbc4eeb4)
![image](https://github.com/DishanChulawnasa/Single-Cycle-MIPS_Processor/assets/129721116/7c1facc8-1ad2-42fa-ab90-2b84e293408f)

