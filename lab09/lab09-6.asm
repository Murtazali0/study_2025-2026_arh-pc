%include 'in_out.asm'

SECTION .data
msg: DB 'Результат: ',0

SECTION .text
GLOBAL _start
_start:
    ; --- Вычисление выражения (3+2)*4+5 ---
    ; ВАЖНО: mul всегда умножает EAX на операнд!

    ; Способ 1: Используем только eax
    mov eax, 3      ; eax = 3
    add eax, 2      ; eax = 5
    mov ebx, 4      ; ebx = 4
    mul ebx         ; eax = 5 * 4 = 20
    add eax, 5      ; eax = 25

    ; --- Вывод результата ---
    mov ebx, eax    ; сохраняем результат
    mov eax, msg
    call sprint
    mov eax, ebx
    call iprintLF

    call quit
