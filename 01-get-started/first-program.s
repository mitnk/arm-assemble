/* first-program.s - do nothing but return an error code */
/* name starts with a dot (.) is a directive for GNU Assembler */
/* 'main' is our entry point and must be global */
.global main
.func main

/* this is call a label */
main:
    /* and these are instructions */
    mov r0, #2  /* put a 2 inside the register r0 */
    /* bx means branch and exchange */
    /* here we branch to whatever `lr` register says */
    bx lr       /* retur from main */
