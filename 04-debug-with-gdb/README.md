# Debug with gdb

```bash
$ $ gdb --args ./store
GNU gdb (Raspbian 7.7.1+dfsg-5) 7.7.1
Copyright (C) 2014 Free Software Foundation, Inc.

(gdb) disassemble
Dump of assembler code for function main:
=> 0x000103e8 <+0>: ldr r1, [pc, #36]   ; 0x10414 <addr_of_myvar1>
   0x000103ec <+4>: mov r3, #3
   0x000103f0 <+8>: str r3, [r1]
   0x000103f4 <+12>:    ldr r2, [pc, #28]   ; 0x10418 <addr_of_myvar2>
   0x000103f8 <+16>:    mov r3, #4
   0x000103fc <+20>:    str r3, [r2]
   0x00010400 <+24>:    add r0, r1, r2
   0x00010404 <+28>:    ldr r1, [r1]
   0x00010408 <+32>:    ldr r2, [r2]
   0x0001040c <+36>:    add r0, r1, r2
   0x00010410 <+40>:    bx  lr
End of assembler dump.

(gdb) info registers r0 r1 r2 r3
r0             0x1  1
r1             0x7efffb94   2130705300
r2             0x7efffb9c   2130705308
r3             0x103e8  66536

(gdb) info registers r4 r5 r6 r7
r4             0x0  0
r5             0x0  0
r6             0x102c0  66240
r7             0x0  0

(gdb) p $r4 = 17
$1 = 17

(gdb) info registers r4 r5 r6 r7
r4             0x11 17
r5             0x0  0
r6             0x102c0  66240
r7             0x0  0

(gdb) stepi
0x000103ec in main ()

(gdb) disassemble
Dump of assembler code for function main:
   0x000103e8 <+0>: ldr r1, [pc, #36]   ; 0x10414 <addr_of_myvar1>
=> 0x000103ec <+4>: mov r3, #3
   0x000103f0 <+8>: str r3, [r1]
   0x000103f4 <+12>:    ldr r2, [pc, #28]   ; 0x10418 <addr_of_myvar2>
   0x000103f8 <+16>:    mov r3, #4
   0x000103fc <+20>:    str r3, [r2]
   0x00010400 <+24>:    add r0, r1, r2
   0x00010404 <+28>:    ldr r1, [r1]
   0x00010408 <+32>:    ldr r2, [r2]
   0x0001040c <+36>:    add r0, r1, r2
   0x00010410 <+40>:    bx  lr
End of assembler dump.

(gdb) info register r1
r1             0x205b4  132532

(gdb) p &myvar1
$1 = (<data variable, no debug info> *) 0x205b4

(gdb) p myvar1
$2 = 0

(gdb) stepi
0x000103f0 in main ()

(gdb) disas
Dump of assembler code for function main:
   0x000103e8 <+0>: ldr r1, [pc, #36]   ; 0x10414 <addr_of_myvar1>
   0x000103ec <+4>: mov r3, #3
=> 0x000103f0 <+8>: str r3, [r1]
   0x000103f4 <+12>:    ldr r2, [pc, #28]   ; 0x10418 <addr_of_myvar2>
   0x000103f8 <+16>:    mov r3, #4
   0x000103fc <+20>:    str r3, [r2]
   0x00010400 <+24>:    add r0, r1, r2
   0x00010404 <+28>:    ldr r1, [r1]
   0x00010408 <+32>:    ldr r2, [r2]
   0x0001040c <+36>:    add r0, r1, r2
   0x00010410 <+40>:    bx  lr
End of assembler dump.

(gdb) info register r3
r3             0x3  3

(gdb) stepi
0x000103f4 in main ()

(gdb) disas
Dump of assembler code for function main:
   0x000103e8 <+0>: ldr r1, [pc, #36]   ; 0x10414 <addr_of_myvar1>
   0x000103ec <+4>: mov r3, #3
   0x000103f0 <+8>: str r3, [r1]
=> 0x000103f4 <+12>:    ldr r2, [pc, #28]   ; 0x10418 <addr_of_myvar2>
   0x000103f8 <+16>:    mov r3, #4
   0x000103fc <+20>:    str r3, [r2]
   0x00010400 <+24>:    add r0, r1, r2
   0x00010404 <+28>:    ldr r1, [r1]
   0x00010408 <+32>:    ldr r2, [r2]
   0x0001040c <+36>:    add r0, r1, r2
   0x00010410 <+40>:    bx  lr
End of assembler dump.

(gdb) p myvar1
$3 = 3

(gdb) c
Continuing.
[Inferior 1 (process 12132) exited with code 07]

(gdb) quit
```
