# Registers

Via [http://thinkingeek.com/2013/01/10/arm-assembler-raspberry-pi-chapter-2/](http://thinkingeek.com/2013/01/10/arm-assembler-raspberry-pi-chapter-2/)

A processor is nothing but a powerful calculator. Calculations can only
be carried using values stored in very tiny memories called *registers*.

The ARM processor in RPi has 16 integer registers and 32 floating point
registers. Those 16 integer registers in ARM have names from r0 to r15.
They can hold 32 bits. With those bits you can encode whatever you want.
Usually, these values are encoded in two's complement.

## Basic Arithmetic

See file `sum01.s`.

```bash
$ make
$ ./sum ; echo $?
7
```

We can only use two registers:

```asm
/* -- sum02.s */
.global main
.func main

main:
    mov r0, #3      /* r0 ← 3 */
    mov r1, #4      /* r1 ← 4 */
    add r0, r0, r1  /* r0 ← r0 + r1 */
    bx lr
```
