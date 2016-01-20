/* Sum of 1, 2, 3, ..., 22 */
.text
.global main

main:
    mov r1, #1
    mov r0, #0

begin_of_loop :
    add r0, r1, r0
    add r1, r1, #1
    cmp r1, #100
    bgt end_of_loop
    b begin_of_loop

end_of_loop :
    bx lr
