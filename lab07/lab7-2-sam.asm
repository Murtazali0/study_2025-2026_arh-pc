%include 'in_out.asm'
section .data
    msg1 db 'Наибольшее число: ',0h
    a dd 54
    b dd 62
    c dd 87

section .bss
    max resd 1

section .text
    global _start

_start:
    mov ecx, [a]
    mov [max], ecx

    cmp ecx, [b]
    jg check_c
    mov ecx, [b]
    mov [max], ecx

check_c:
    mov ecx, [max]
    cmp ecx, [c]
    jg print_result
    mov ecx, [c]
    mov [max], ecx

print_result:
    ; Вывод результата
    mov eax, msg1
    call sprint

    mov eax, [max]
    call iprintLF

    call quit
