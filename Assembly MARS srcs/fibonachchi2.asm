    .data
    .text
    .globl main

main:
    # Initialize variables
    addi $t0, $zero, 65536 # Upper limit for Fibonacci numbers
    addi $t1, $zero, 2     # Loop counter
    addi $t2, $zero, 0     # Index for fib_values array

    # Base cases: fib(0) = 0, fib(1) = 1
    addi $zero, $zero, 0   # fib_values[0] = 0
    addi $t1, $t1, 1        # fib_values[1] = 1
    addi $t2, $t2, 8        # Move to the next empty slot in fib_values

fibonacci_loop:
    # Calculate fib(t1) = fib(t1-1) + fib(t1-2)

    # Load fib_values[t1-1]
    sub $t2, $t2, 4
    nor $t3, $zero, $zero  # $t3 = fib_values[t1-1]

    # Move to fib_values[t1-2]
    sub $t2, $t2, 4
    nor $t4, $zero, $zero  # $t4 = fib_values[t1-2]

    # $t5 = fib(t1-1) + fib(t1-2)
    add $t5, $t3, $t4

    # Move to the next empty slot in fib_values
    add $t2, $t2, 8

    # Save fib(t1) in fib_values[t1]
    nor $t5, $t5, $zero
    sub $t2, $t2, 4
    nor $zero, $t5, $zero

    # Check if the generated Fibonacci number is less than 65536
    slt $t6, $t5, $t0
    beq $t6, $zero, end_program  # If fib(t1) is greater than or equal to 65536, exit the program

    # Increment loop counter
    addi $t1, $t1, 1

    # Continue the loop
    j fibonacci_loop

end_program:
    # Exit program
    addi $v0, $zero, 10    # Exit system call code
    syscall
