SECTION .data
    prompt db 'Введите строку: ', 0
    prompt_len equ $ - prompt

SECTION .bss
    buffer resb 80
    buffer_len equ 80

SECTION .text
    global _start

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

 
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, buffer_len
    int 0x80


    mov esi, eax


    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, esi
    int 0x80

 
    mov eax, 1
    mov ebx, 0
    int 0x80