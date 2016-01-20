/* Collatz conjecture */
.text
.global main
main:
    mov r1, #123

loop:
    cmp r1, #1
    beq end

    and r2, r1, #1  /* the and (&) operator */
    cmp r2, #1
    beq odd

even:  /* this lable can be ignored */
    mov r1, r1, ASR #1  /* r1 <- (r1 >> 1) */
    b loop

odd:
    add r1, r1, r1, LSL #1  /* r1 <- r1 + (r1 << 1) */
    add r1, r1, #1
    b loop

end:
    mov r0, r1
    bx lr
