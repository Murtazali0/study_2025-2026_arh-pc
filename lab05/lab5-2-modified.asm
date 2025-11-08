%include 'in_out.asm'

SECTION .data
    msg db 'Введите строку: ', 0h 

SECTION .bss
    buf1 resb 80

SECTION .text
    global _start

_start:

    mov eax, msg
    call sprint


    mov ecx, buf1
    mov edx, 80
    call sread


    mov eax, buf1
    call sprint


    call quit