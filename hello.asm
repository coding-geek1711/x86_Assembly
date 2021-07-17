section.data
    message db "Hello World!!", 10
    message_len equ $-message

section.text
    global _start

_start:
    mov rax, 0x01              ; syscall with id 1 (SYS_WRITE) invoke
    mov rdi, 0x01              ; SYS_WRITE first arg FD ==> 1 (Standard output)
    mov rsi, message        ; Data Buffer memory location
    mov rdx, message_len    ; Length of data buffer
    syscall

    mov rax, 0x60           ; syscall with id 0x60 (sys_exit) invoke
    mov rdi, 0           ; sys_exit argument 0 to show no error
    syscall

    