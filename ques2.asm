[org 0x0100]
 
section .data
    array_nums dw  30, 24, 19, 2, 5, 28, 86
    max_value dw 0
 
section .text
    mov si, array_nums      ; load the address of the array into si
    mov cx, 7              ; initialize loop counter (half the number of elements)
 
find_max_pair:
    mov ax, [si]            ; load the first pair of elements
    mov bx, [si + 2]
 
    cmp ax, bx              ; compare the pair
    jl swap_values          ; if the second element is greater, swap them
 
    jmp next_pair           ; if the first element is greater or equal, continue
 
swap_values:
    xchg ax, bx             ; swap the values
 
next_pair:
    mov [si], ax            ; store the updated pair back in the array
    mov [si + 2], bx
 
    add si, 4               ; move to the next pair
    loop find_max_pair      ; repeat the loop
 
    mov [max_value], ax     ; store the maximum value in max_value
 
    mov ax, 0x4c00         ; terminate program
    int 0x21