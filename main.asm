global _start
section .text
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, x
    mov rdx, 7

    syscall

    mov rax, 0x3c
    xor rdi, rdi
    syscall


section .data
x: db "hello", 0, 0x0a