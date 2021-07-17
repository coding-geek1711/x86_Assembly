# Execute instructions

- nasm elf -o object_file_name.o helloworld.asm    (compiles to .obj file)

-  nasm -f elf64 -o obj_files/object_file.o input_asm_code.asm  (64 bit assembler to .obj)

- We need to link these object files with a linker

- ld -m elf_i386 -o output_name helloworld.o         (Linker links and gives executable binary)     this is for 32 bit compilation

- ld obj_files/object_file.o -o elf_executables/executable_name   (64 bit executable)

## Introduction:

x86_asm has several different registers, 
rax, rdi, rsi, eax, edi, esi etc

r ==> 64 bit register
e ==> 32 bit register

### Whats a syscall? 
    - A system call or a syscall is when a program requests a service from a kernel
    - All syscalls have IDS associated with them (an integer)
    - Syscalls also take arguments

    ```
        Arg             Registers
        ID              rax
        1               rdi
        2               rsi
        3               rdx
        4               r10
        5               r8
        6               r9
    ```
    
    - Say u need a syscall which writes to console (called SYS_WRITE)

    ```
        SYSCALL     ID      ARG1        ARG2        ARG3        ARG4

        SYS_READ    0       #FD         $BUFFER     #COUNT
        SYS_WRITE   1       #FD         $BUFFER     #COUNT
        SYS_OPEN    2       $Filename   #flags      #mode
        SYS_CLOSE   3       #FD         
        .
        .
        .
        .
        
    ```
    - SYS_WRITE (Used for hello world!!)
    ```
        Argument Type               Argument Description

        FD                          0(Standard Input)
                                    1(Standard Output)
                                    2(Standard Error)

        Buffer                      Memory address of string

        Count                       Length of string
    ```


## Hello World

- ASM works in a way similar to how C works, but a bit more weirdly

- for printing to console we need to access the native system call of SYS_WRITE which has an id of 1, and needs the data buffer as well as the count 

```asm
    mov rax, 1      ; Syscall with id 1
    mov rdi, 1      ; Syswrite with file description id of 1 (STANDARD OUTPUT)
    mov rsi, buffer ; Data buffer memory address
    mov rdx, len    ; Length of data buffer
```

## Input Output
- ASM input requires system api call named SYS_READ
- FD ==> 0 (Standard input)
- call ==> Like functions with ret to jump back to control flow
- if using hexadecimals, use only that 
- resb is used to reserve some bytes at a memory location


Check code to see what happens

## Math in ASM

- Add a, b ==> a = a + b
- Sub a, b ==> a = a - b
- mul regb ==> rax = rax * regb
- div regb ==> rax = rax / regb
- neg reg ==> reg = -1 * reg
- inc reg ==> reg = reg + 1
- dec reg ==> reg = reg - 1
- adc a, b ==> a = a + b + CF
- sbb a, b ==> a = a - b - CF