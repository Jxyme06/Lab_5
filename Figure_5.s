.section .data

Numbers:
    .long 1
    .long 15
    .long 4
    .long 2
    .long 7
    .long 9
    .long 23
    .long 7
    .long 3
    .long 11

Array_length:
    .long 10



.section .text
.globl main

main:
    movl $0, %edx                   # Initialize register that will hold the greatest number
    movl $0, %ecx   # Initialize loop counter
    movl $Numbers, %eax             # Initialize start of array of number by loading the memory address of the array into the eax register ($label loads the address of the label instead of the first value if you don't put $)
    


loop:
    cmpl %edx, (%eax) # Compare the current greatest integer to the value index in the Numbers array
    jg greater

increment:
    incl %ecx                       # Increment the loop counter
    cmpl %ecx, Array_length         # If the array length is less than or equal to the loop counter value, jump to the end label
    jle end
    addl $4, %eax                   # Increment the value of the eax register by 4 bytes since it holds the index in the array of integers which are 4 bytes
    jmp loop    

greater:
    movl (%eax), %edx               # Move the value at the current index to the edx register as it is now the new greatest number
    jmp increment                   # Jump back to the increment section to complete the loop



end:
    movl %edx, %eax
    ret

.section .note.GNU-stack,"",@progbits           # Avoid executable stack warning
