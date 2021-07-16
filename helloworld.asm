global _start               ; linker starts here
section.text                ; The logic part is here
    _start:
        mov eax, 0x04           ; invoke a write syscall    (check out unistd.h from /usr/include/unistd.h)
        mov ebx, 1              ; use stdout as the fd for syscall
        mov ecx, message        ; give the data buffer
        mov edx, message_len    ; supply message length as parameter
        int 0x80                ; interrupt 0x80 ==> identifier for the syscall

        ; now exit from the program
        mov eax, 0x01           ; 0x01 is the hex for exiting (unistd.h)
        mov ebx, 0x00           ; give a return value for the exit
        int 0x80                ; sys call


section.data                ; The variable declaration happens here
    message: db "Hello World!!", 0x0A     ; message here as a data buffer with 0x0A as a new line (check chr(0x0A) in python)
    message_len equ $-message       ; message len put here by nasm while compiling