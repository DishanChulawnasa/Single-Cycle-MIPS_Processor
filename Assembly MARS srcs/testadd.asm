    .text
    .globl main

main:
    # Initialize variables
    addi $t0, $zero, 34    # First number (decimal)
    addi $t1, $zero, 184   # Second number (decimal)
    addi $t2, $zero, 0     # Result

    # Add two numbers
    add $t2, $t0, $t1

    # Exit program
    addi $v0, $zero, 10    # Exit system call code
    syscall
