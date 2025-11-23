%include 'in_out.asm'
section .data
    msg_x db 'Enter x: ',0
    msg_a db 'Enter a: ',0
    msg_result db 'Result: ',0

section .bss
    x resd 1
    a resd 1
    buffer resb 10

section .text
    global _start

_start:
    ; Ввод значения x
    mov eax, msg_x
    call sprint
    mov eax, buffer
    mov ebx, 10
    call sread
    mov eax, buffer
    call atoi
    mov [x], eax
    
    ; Ввод значения a
    mov eax, msg_a
    call sprint
    mov eax, buffer
    mov ebx, 10
    call sread
    mov eax, buffer
    call atoi
    mov [a], eax
    
    ; Вычисление функции f(x)
    mov eax, [x]
    mov ebx, [a]
    
    cmp eax, ebx        ; Сравниваем x и a
    jg greater          ; если x > a
    
    ; x <= a: f(x) = 15
    mov eax, 15
    jmp print_result
    
greater:
    ; x > a: f(x) = 2(x - a)
    sub eax, ebx        ; eax = x - a
    mov ebx, 2
    mul ebx             ; eax = 2 * (x - a)

print_result:
    ; Вывод результата
    mov ebx, eax        ; сохраняем результат
    mov eax, msg_result
    call sprint
    mov eax, ebx        ; восстанавливаем результат
    call iprintLF
    
    ; Завершение программы
    call quit

