DEFAULT REL

global main

section .text
main:
    xor rbx, rbx 
    jmp loop


loop:
    
    
    mov rax, 1
    mov rdi, 1
    mov rsi, str
    mov rdx, len 
    syscall

    inc rbx 
    cmp rbx, 5
    jl loop 

    mov rax, 0x3c
    xor rdi, rdi
    syscall




section .data
str: db "hello", 0xa, 0
len equ $ - str


