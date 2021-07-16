# Execute instructions

- nasm elf -o object_file_name.o helloworld.asm    (compiles to .obj file)

- We need to link these object files with a linker

- ld -m elf_i386 -o output_name helloworld.o         (Linker links and gives executable binary)