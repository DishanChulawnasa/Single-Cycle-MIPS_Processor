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