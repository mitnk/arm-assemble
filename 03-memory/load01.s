/* -- load01.s */

/* -- date section */
.data

.balign 4  /* ensure variable is 4-byte aligned */
/* define storage for myvar1 */
myvar1:
    /* contents of myvar1 is just 4 bytes containing value `3` */
    .word 3

.balign 4
myvar2:
    .word 4

/* -- code section */
.text

.balign 4
.global main
main:
    ldr r1, addr_of_myvar1  /* r1 <- &myvar1 */
    ldr r1, [r1]            /* r1 <- *r1 */
    ldr r2, addr_of_myvar2
    ldr r2, [r2]
    add r0, r1, r2
    bx lr

/* the labels of `myvar1` and `myvar2` are in `.data` section */
/* that's why we need to re-refer them in code section. */

/* when the assembly emits the binary code, `.word myvar1` will not */
/* be address of `myvar1` but instead it will be a relocation. */
/* A relocation is the way the assembly uses to emit an address, */
/* the exact value of which is unknown but it will be known when linked. */
addr_of_myvar1 : .word myvar1
addr_of_myvar2 : .word myvar2
