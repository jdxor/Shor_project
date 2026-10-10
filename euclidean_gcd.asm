
section .text
    global _start



_start:
    mov eax, [num1]
    mov ebx, [num2]



loop_gcd:
    xor edx, edx
    div ebx

    mov eax, ebx
    mov ebx, edx
    
    
    cmp ebx, 0
    jne loop_gcd


    mov ebx, eax
    mov eax, 1
    int 0x80



section .data
    num1 dd 120
    num2 dd 72
