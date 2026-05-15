DEFAULT REL ;relative addressing

global main ;start symbol
section .text ;code section
main:
    mov rax, 1 ; syswrite
    mov rdi, 1 ; file descriptor 1 for write
    lea rsi, [start_print] ; char*
    mov rdx, sp_len ; length of the string
    syscall

    mov byte [un_init], 'h',
    mov byte [un_init+1], 'i',
    mov byte [un_init+2], 0x0a,
    mov byte [un_init+3], 0,


    mov rax, 1 ; syswrite
    mov rdi, 1 ; file descriptor 1 for write
    lea rsi, [un_init] ; char*
    mov rdx, 10 ; length of the string
    syscall ; invoke

    jmp exit_function ; in jmp rbp wont be saved, so there is no going back

    

exit_function:
    mov rax, 1
    mov rdi, 1
    mov rsi, var
    mov rdx, v_len

    syscall

    mov rax, 0x3c ; sysexit 
    xor rdi, rdi ;set error code to 0
    syscall

section .bss
un_init: resb 64


section .data
start_print: db "program start!", 0xa,  0; 0 is the nullbyte to indicate the end of the string, 0x0a is \n
sp_len equ $ - start_print

var: db "function", 0xa,  0
v_len equ $ - var
