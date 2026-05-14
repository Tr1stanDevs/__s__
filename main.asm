DEFAULT REL ;relative addressing

global main
section .text
main:
    mov rax, 1
    mov rdi, 1
    lea rsi, [start_print]
    mov rdx, sp_len

    syscall

    jmp exit_function

    

exit_function:
    mov rax, 1
    mov rdi, 1
    mov rsi, var
    mov rdx, v_len
    syscall

    mov rax, 0x3c ; sysexit 
    xor rdi, rdi ;set error code to 0
    syscall



section .data
start_print: db "program start!", 0, 0x0a
sp_len equ $ - start_print

var: db "function", 0, 0xa 
v_len equ $ - var