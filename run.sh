nasm -f elf64 main.asm
ld main.o -o main -e main
./main

xxd main > hexdump.txt
objdump -M intel -D ./main > instructions.txt