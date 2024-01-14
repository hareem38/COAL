[org 0x0100]
section .data
    newline db 0xA  ; Newline character for formatting
 
section .bss
    user_input resb 10  ; Buffer to store user input
 
section .text
    global _start
 
_start:
    ; Take 10 characters input from the user
    mov ecx, 10
    mov ebx, user_input
input_loop:
    mov ah, 1
    int 21h
    mov [ebx], al
    inc ebx
    loop input_loop
 
    ; Print characters in reverse order
    mov ecx, 10
    lea ebx, [user_input + 9]  ; Set ebx to the end of the user_input buffer
print_loop:
    mov al, [ebx]
    ; Check for newline character to determine the end of input
    cmp al, newline
    je end_program
    ; Print the character
    mov ah, 2
    int 21h
 
    ; Move to the previous character in the buffer
    sub ebx, 1
    loop print_loop
 
end_program:
    ; Exit program
    mov ah, 4Ch
    int 21h