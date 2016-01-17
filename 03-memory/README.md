# Memory

If processors were only able to work on registers it would be rather limited.
Luckily, we have memory, where code and data are stored.

In 386 and x86-64 architectures, instructions can access registers or memory.
We cannot do this in ARM where all operands must be registers. But we can
load data to a register or store data from a register to memory.

## Addresses

In ARM, a 32-bit number identifies every byte of the memory. This means we
can keep an address inside a register.

Labels in the assembly are just symbolic names to addresses in your program.

Define a 4 byte variable and initialize it to 3, and label it as `myvar1`.

```asm
.balign 4
myvar1:
    .word 3
```

Data is usually kept together in what is called a `data` section.

Read code `load01.s` and `store01.s`.
