# Single-Cycle-MIPS_Processor
Designed a single clock cycle MIPS Processor by Verilog HDL. 
Basic modules: Program Counter, Adder, Instruction Memory, Register File, Control Unit, Sign Extender, ALU, ALU Control Unit, Data Memory, Bit Shifter, Jump Shifter, 32 bit 2:1 Multiplexer, 5 bit 2:1 Multiplexer













MIPS instructions: lw, sw, beq, bne, add, sub, set less than, jump 
ALU Control:








Control:











*Jump also included. when Opcode = 000010, Jump = 1, Otherwise Jump = 0.
Effect of Control Signals











*Jump Effect when deasserted: None
*Jump Effect when asserted: concatenating the upper 4 bits of the current PC + 4 to the 26-bit address fi eld in the jump instruction and adding 00 as the 2 low-order bits.

RTL Schematic of MIPS Processor (Xilinx Vivado):



























Simulation:
1.	Add two Numbers:
Assembly code for MARS MIPS Emulator:

    .text
    .globl main

main:
    # Initialize values
    li $t0, 34        # Load 34 into register $t0
    li $t1, 184       # Load 184 into register $t1

    # Add the values
    add $t2, $t0, $t1 # $t2 = $t0 + $t1

    # Exit program
    li $v0, 10         # syscall code for exit
    syscall            # make system call
	
	Machine Code:
		00100100000010000000000000100010
00100100000010010000000010111000
00000001000010010101000000100000
00100100000000100000000000001010
00000000000000000000000000001100

	Machine Code (hex) (instruction.memory.mem):
	24080022
240900b8
01095020
2402000a
0000000c







MIPS Emulator:




















Simulation in Xilinx Vivado (MIPS_TOP_tb_behav.wcfg):
	















2.	Fibonachchi Numbers:
Assembly code for MARS MIPS Emulator:

# Compute first twelve Fibonacci numbers and put in array, then print
      .data
fibs: .word   0 : 12        # "array" of 12 words to contain fib values
size: .word  12             # size of "array" 
      .text
      la   $t0, fibs        # load address of array
      la   $t5, size        # load address of size variable
      lw   $t5, 0($t5)      # load array size
      li   $t2, 1           # 1 is first and second Fib. number
      add.d $f0, $f2, $f4
      sw   $t2, 0($t0)      # F[0] = 1
      sw   $t2, 4($t0)      # F[1] = F[0] = 1
      addi $t1, $t5, -2     # Counter for loop, will execute (size-2) times
loop: lw   $t3, 0($t0)      # Get value from array F[n] 
      lw   $t4, 4($t0)      # Get value from array F[n+1]
      add  $t2, $t3, $t4    # $t2 = F[n] + F[n+1]
      sw   $t2, 8($t0)      # Store F[n+2] = F[n] + F[n+1] in array
      addi $t0, $t0, 4      # increment address of Fib. number source
      addi $t1, $t1, -1     # decrement loop counter
      bgtz $t1, loop        # repeat if not finished yet.
      la   $a0, fibs        # first argument for print (array)
      add  $a1, $zero, $t5  # second argument for print (size)
      jal  print            # call print routine. 
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
		
#########  routine to print the numbers on one line. 

      .data
space:.asciiz  " "          # space to insert between numbers
head: .asciiz  "The Fibonacci numbers are:\n"
      .text
print:add  $t0, $zero, $a0  # starting address of array
      add  $t1, $zero, $a1  # initialize loop counter to array size
      la   $a0, head        # load address of print heading
      li   $v0, 4           # specify Print String service
      syscall               # print heading
out:  lw   $a0, 0($t0)      # load fibonacci number for syscall
      li   $v0, 1           # specify Print Integer service
      syscall               # print fibonacci number
      la   $a0, space       # load address of spacer for syscall
      li   $v0, 4           # specify Print String service
      syscall               # output string
      addi $t0, $t0, 4      # increment address
      addi $t1, $t1, -1     # decrement loop counter
      bgtz $t1, out         # repeat if not finished
      jr   $ra              # return
		






	Machine Code:
		00111100000000010001000000000001
00110100001010000000000000000000
00111100000000010001000000000001
00110100001011010000000000110000
10001101101011010000000000000000
00100100000010100000000000000001
01000110001001000001000000000000
10101101000010100000000000000000
10101101000010100000000000000100
00100001101010011111111111111110
10001101000010110000000000000000
10001101000011000000000000000100
00000001011011000101000000100000
10101101000010100000000000001000
00100001000010000000000000000100
00100001001010011111111111111111
00011101001000001111111111111001
00111100000000010001000000000001
00110100001001000000000000000000
00000000000011010010100000100000
00001100000100000000000000010111
00100100000000100000000000001010
00000000000000000000000000001100
00000000000001000100000000100000
00000000000001010100100000100000
00111100000000010001000000000001
00110100001001000000000000110110
00100100000000100000000000000100
00000000000000000000000000001100
10001101000001000000000000000000
00100100000000100000000000000001
00000000000000000000000000001100
00111100000000010001000000000001
00110100001001000000000000110100
00100100000000100000000000000100
00000000000000000000000000001100
00100001000010000000000000000100
00100001001010011111111111111111
00011101001000001111111111110110
00000011111000000000000000001000

	Machine Code (hex) (instruction.memory.mem):
	3c011001
34280000
3c011001
342d0030
8dad0000
240a0001
46241000
ad0a0000
ad0a0004
21a9fffe
8d0b0000
8d0c0004
016c5020
ad0a0008
21080004
2129ffff
1d20fff9
3c011001
34240000
000d2820
0c100017
2402000a
0000000c
00044020
00054820
3c011001
34240036
24020004
0000000c
8d040000
24020001
0000000c
3c011001
34240034
24020004
0000000c
21080004
2129ffff
1d20fff6
03e00008

MIPS Emulator:




















Simulation in Xilinx Vivado (MIPS_TOP_tb_behav.wcfg):































