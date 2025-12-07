%include 'in_out.asm'

SECTION .data
    msg_sum:  DB 'Сумма f(x_i) = ',0
    func_msg: DB 'f(x) = 4x + 3',0
    err_msg:  DB 'Ошибка: нет аргументов!',0

SECTION .bss
    sum:      RESD 1      ; для хранения суммы (32 бита)
    x:        RESD 1      ; для текущего значения x

SECTION .text
GLOBAL _start
_start:
    ; --- Вывод информации о функции ---
    mov  eax, func_msg
    call sprintLF

    ; --- Инициализация суммы ---
    mov  dword [sum], 0

    ; --- Получение аргументов ---
    pop  ecx              ; ecx = argc (количество аргументов)
    pop  eax              ; eax = argv[0] (имя программы)

    ; --- Проверка наличия аргументов ---
    dec  ecx              ; уменьшаем argc на 1 (пропускаем имя программы)
    cmp  ecx, 0
    jle  _error           ; если аргументов нет

    ; --- Цикл обработки аргументов ---
_process_args:
    pop  eax              ; берем следующий аргумент (строку)
    call atoi             ; преобразуем в число
    mov  [x], eax         ; сохраняем значение x

    ; --- Вычисление f(x) через подпрограмму ---
    call _calcul

    ; --- Добавление к сумме ---
    add  [sum], eax

    ; --- Переход к следующему аргументу ---
    loop _process_args    ; ecx уменьшается на 1 и если > 0, переходит на метку

    ; --- Вывод результата ---
    mov  eax, msg_sum
    call sprint           ; "Сумма f(x_i) = "

    mov  eax, [sum]
    call iprintLF         ; вывод суммы

    call quit

_error:
    mov  eax, err_msg
    call sprintLF
    call quit

_calcul:
    push ebx              ; сохраняем ebx (соглашение о вызовах)

    mov  eax, [x]         ; eax = x
    mov  ebx, 4           ; ebx = 4
    mul  ebx              ; eax = x * 4
    add  eax, 3           ; eax = 4x + 3

    pop  ebx              ; восстанавливаем ebx
    ret                   ; возврат из подпрограммы
