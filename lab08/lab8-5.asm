%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x)=4x+3",0
msg_result db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov esi, 0

    mov eax, msg_func
    call sprintLF

next:
    cmp ecx, 0
    jz _end

    pop eax
    call atoi

    mov ebx, eax
    mov eax, ebx
    imul eax, 4
    add eax, 3

    add esi, eax

    loop next

_end:
    mov eax, msg_result
    call sprint
    mov eax, esi
    call iprintLF
    call quit
