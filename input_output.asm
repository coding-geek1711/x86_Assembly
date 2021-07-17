section .data
    askName db "What is your Name? ", 0x0A
    askNameLen equ $-askName 
    printName db "Your Name is "
    printNameLen equ $-printName 

section .bss
    name resb 16                    ; resb => reserve bytes
section .text
    global _start

_start:
    call printAskName
    call getName
    call printNameText
    call printUserName
    

    mov rax, 0x3C
    mov rdi, 0
    syscall

printAskName:
    mov rax, 1
    mov rdi, 1
    mov rsi, askName 
    mov rdx, askNameLen
    syscall
    ret

printNameText:
    mov rax, 1
    mov rdi, 1
    mov rsi, printName
    mov rdx, printNameLen
    syscall
    ret

printUserName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret

getName:
    mov rax, 0                  ; syscall named sys_read
    mov rdi, 0                  ; standard input fd
    mov rsi, name               ; store to memory location named "name"
    mov rdx, 16                 ; max count of "name"
    syscall 
    ret