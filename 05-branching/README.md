# Branching

In real world, instead of excute one instruction after the other,
we need to react to existing conditions which may require different
sequences of instructions. `branch` is for this purpose.

The register `r15` is very special. It has another name: `pc`.
**pc** means *Program Counter*, while in other architectures like
386 or x86_64, it calls `ip` for *Instruction Pointer*).

In general, **pc** contains the address of the next instruction going to
be executed.

When the ARM processor executes an instruction, two things may happen
at the end of its execution. If it does not modify **pc**, **pc** is just
incremented by 4. Because instrucations are 32-bit wide in ARM.
Once the processor has fully executed an instruction then it uses the
value in the **pc** as the address for the next instruction to execute.

The process of changing the value of **pc** is called *branching*.

## Unconditional branches

```asm
/* -- branch01.s */
.text
.global main
main:
    mov r0, #2 /* r0 ← 2 */
    b end      /* branch to 'end' */
    mov r0, #3 /* r0 ← 3 */
end:
    bx lr
```

oubput:

```bash
$ ./branch ; echo $?
2
```

### Register called cpsr

`cpsr` means *Current Program Status Register*.
Its value include 4 condition code flags:
N (negative), Z (Zero), C (carry), and V (overflow).
Other instructions can read or update `cpsr`'s value.

- N will be enabled if the result of the instruction yields a negative number. Disabled otherwise.
- Z will be enabled if the result of the instruction yields a zero value. Disabled if nonzero.
- C will be enabled if the result of the instruction yields a value that requires a 33rd bit to be fully represented. For instance an addition that overflows the 32 bit range of integers. There is a special case for C and subtractions where a non-borrowing subtraction enables it, disabled otherwise: subtracting a larger number to a smaller one enables C, but it will be disabled if the subtraction is done the other way round.
- V will be enabled if the result of the instruction yields a value that cannot be represented in 32 bits two’s complement.

```asm
cmp r1, r2 /* updates cpsr doing "r1 - r2", but r1 and r2 are not modified */
```

## Conditional branches


```asm
/* -- compare01.s */
.text
.global main
main:
    mov r1, #2       /* r1 ← 2 */
    mov r2, #2       /* r2 ← 2 */
    cmp r1, r2       /* update cpsr condition codes with the value of r1-r2 */
    beq case_equal   /* branch to case_equal only if Z = 1 */
case_different :
    mov r0, #2       /* r0 ← 2 */
    b end            /* branch to end */
case_equal:
    mov r0, #1       /* r0 ← 1 */
end:
    bx lr
```

Suffix of `b` includes:

- EQ (equal) When Z is enabled (Z is 1)
- NE (not equal). When Z is disabled. (Z is 0)
- GE (greater or equal than, in two’s complement). When both V and N are enabled or disabled (V is N)
- LT (lower than, in two’s complement). This is the opposite of GE, so when V and N are not both enabled or disabled (V is not N)
- GT (greather than, in two’s complement). When Z is disabled and N and V are both enabled or disabled (Z is 0, N is V)
- LE (lower or equal than, in two’s complement). When Z is enabled or if not that, N and V are both enabled or disabled (Z is 1. If Z is not 1 then N is V)
- MI (minus/negative) When N is enabled (N is 1)
- PL (plus/positive or zero) When N is disabled (N is 0)
- VS (overflow set) When V is enabled (V is 1)
- VC (overflow clear) When V is disabled (V is 0)
- HI (higher) When C is enabled and Z is disabled (C is 1 and Z is 0)
- LS (lower or same) When C is disabled or Z is enabled (C is 0 or Z is 1)
- CS/HS (carry set/higher or same) When C is enabled (C is 1)
- CC/LO (carry clear/lower) When C is disabled (C is 0)
