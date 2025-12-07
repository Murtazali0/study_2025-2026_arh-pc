%include 'in_out.asm'

SECTION .data
    msg:    DB 'Введите x: ', 0
    result: DB 'f(g(x)) = 2*(3x-1)+7 = ', 0

SECTION .bss
    x:   RESB 80
    res: RESB 80

SECTION .text
GLOBAL _start
_start:
    ; --- Основная программа ---
    mov eax, msg
    call sprint      ; Вывод "Введите x: "

    mov ecx, x
    mov edx, 80
    call sread       ; Чтение ввода

    mov eax, x
    call atoi        ; Преобразование в число (x в eax)

    call _calcul     ; Вызов подпрограммы вычисления f(g(x))

    ; --- Вывод результата ---
    mov eax, result
    call sprint      ; Вывод "f(g(x)) = 2*(3x-1)+7 = "

    mov eax, [res]
    call iprintLF    ; Вывод результата

    call quit        ; Завершение программы

; --- Подпрограмма _calcul ---
; Вход:  eax = x
; Выход: eax = 2*(3x-1)+7
_calcul:
    call _subcalcul  ; Вычисляем g(x) = 3x - 1, результат в eax
    mov ebx, 2
    mul ebx          ; eax = g(x) * 2
    add eax, 7       ; eax = 2*g(x) + 7
    mov [res], eax   ; Сохраняем результат
    ret

; --- Подпрограмма _subcalcul ---
; Вход:  eax = x
; Выход: eax = 3x - 1
_subcalcul:
    mov ebx, 3
    mul ebx          ; eax = x * 3
    sub eax, 1       ; eax = 3x - 1
    ret
