# Control Structures

## if else

```asm
if_eval: 
    /* Assembler that evaluates E and updates the cpsr accordingly */
bXX else /* Here XX is the appropiate condition */
then_part: 
   /* assembler for S1, the "then" part */
   b end_of_if
else:
   /* assembler for S2, the "else" part */
end_of_if:
```

## Loops

```asm
while_condition : /* assembler to evaluate E and update cpsr */
  bXX end_of_loop  /* If E is false, then leave the loop right now */
  /* assembler of S */
  b while_condition /* Unconditional branch to the beginning */
end_of_loop:

```

## Collatz conjecture

```c
n = ...;
while (n != 1)
{
  if (n % 2 == 0)
     n = n / 2;
  else
     n = 3*n + 1;
}
```

See code `loop01.s` and `collatz.s`.
