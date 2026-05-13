global main
section .text
main:
    mov rax, 1
    mov rdi, 1
    mov rsi, "hi"
    mov rdx, 4

    syscall

    mov rax, 0x60
    xor rdi, rdi
    syscall


section .data
x: db "hello", 0