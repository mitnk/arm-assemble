/* -- store01.s */

.data

.balign 4
myvar1:
    .word 0

.balign 4
myvar2:
    .word 0

.text

.balign 4
.global main
main:
    ldr r1, addr_of_myvar1
    mov r3, #3
    str r3, [r1]  /* *r1 <- r3 */
    ldr r2, addr_of_myvar2
    mov r3, #4
    str r3, [r2]
    add r0, r1, r2

    ldr r1, [r1]
    ldr r2, [r2]
    add r0, r1, r2
    bx lr

addr_of_myvar1 : .word myvar1
addr_of_myvar2 : .word myvar2
