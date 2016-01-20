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

## break and show more lines

```bash
(gdb) disas main,+(8*4)
Dump of assembler code from 0x103e8 to 0x10408:
=> 0x000103e8 <main+0>: mov r1, #1
   0x000103ec <main+4>: mov r0, #0
   0x000103f0 <begin_of_loop+0>:    add r0, r1, r0
   0x000103f4 <begin_of_loop+4>:    add r1, r1, #1
   0x000103f8 <begin_of_loop+8>:    cmp r1, #100    ; 0x64
   0x000103fc <begin_of_loop+12>:   bgt 0x10404 <end_of_loop>
   0x00010400 <begin_of_loop+16>:   b   0x103f0 <begin_of_loop>
   0x00010404 <end_of_loop+0>:  bx  lr
End of assembler dump.
(gdb) break *0x00010404
Breakpoint 2 at 0x10404
(gdb) c
Continuing.

Breakpoint 2, 0x00010404 in end_of_loop ()
(gdb) disas
Dump of assembler code for function end_of_loop:
=> 0x00010404 <+0>: bx  lr
End of assembler dump.
(gdb) info register r0 r1
r0             0x13ba   5050
r1             0x65 101
(gdb)
```
