DEFAULT REL ;relative addressing

global main ;start symbol
section .text ;code section
main:
    mov rax, 1 ; syswrite
    mov rdi, 1 ; file descriptor 1 for write
    lea rsi, [start_print] ; char*
    mov rdx, sp_len ; length of the string

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



section .data
start_print: db "program start!", 0, 0x0a ; 0 is the nullbyte to indicate the end of the string, 0x0a is \n
sp_len equ $ - start_print

var: db "function", 0, 0xa 
v_len equ $ - var