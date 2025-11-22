%include 'in_out.asm'

SECTION .data
msg: DB 'Вычисление выражения: y = (9x - 8)/8',0
inmsg: DB 'Введите x: ',0
resmsg: DB 'Результат y = ',0
remmsg: DB 'Остаток от деления: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

; Вывод выражения
mov eax, msg
call sprintLF

; Ввод x
mov eax, inmsg
call sprint
mov ecx, x
mov edx, 80
call sread

; Преобразование x в число
mov eax, x
call atoi

; Вычисление f(x) = (9x - 8)/8
mov ebx, eax    ; EBX = x

; Вычисление 9x
mov eax, ebx    ; EAX = x
mov ecx, 9
mul ecx         ; EAX = 9x

; Вычитание 8
sub eax, 8      ; EAX = 9x - 8

; Деление на 8
xor edx, edx    ; Обнуляем EDX для деления
mov ebx, 8
div ebx         ; EAX = (9x - 8)/8, EDX = остаток

; Сохраняем результат
mov edi, eax    ; EDI = результат (целая часть)

; Вывод результата
mov eax, resmsg
call sprint
mov eax, edi
call iprintLF

; Вывод остатка
mov eax, remmsg
call sprint
mov eax, edx
call iprintLF

call quit
