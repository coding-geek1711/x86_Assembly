section .data
    digit db 0, 0x0A

section .text
    global _start

_start:
    ; add maximum of 9 and then ascii chars get printed
    mov rax, 0x01
    mov rdi, 0x08
    add rax, rdi 
    call _printRAXDigit

    ; subtract to a min of 0 then ascii chars get printed
    mov rax, 0x09
    mov rdi, 0x05
    sub rax, rdi
    call _printRAXDigit
    call _sysexit

_printRAXDigit:
    add rax, 48
    mov [digit], al 
    
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

_sysexit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall
    ret