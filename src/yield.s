# 1 "src/yield.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 32 "<command-line>" 2
# 1 "src/yield.S"
.global _ZN3TCB5yieldEPNS_7ContextES1_

_ZN3TCB5yieldEPNS_7ContextES1_:

sd ra, 0(a0)
sd sp, 8(a0)
ld ra, 0(a1)
ld sp, 8(a1)
ret
