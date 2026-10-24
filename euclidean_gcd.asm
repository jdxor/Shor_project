
section .text
    global gcd

gcd:
    push ebp
    mov ebp, esp
    push ebx
    
    mov eax, [ebp + 8]; Num1
    mov ebx, [ebp + 12]; Num2


loop_gcd:
    test ebx, ebx; if EBX == 0
    jz done

    xor edx, edx; Clean EDX
    div ebx; EAX/EBX

    mov eax, ebx
    mov ebx, edx
    jmp loop_gcd


done:
    pop ebx
    pop ebp
    ret; GCD in EAX
