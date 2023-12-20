.intel_syntax noprefix
.extern printf
.globl main
.data
__print_msg: .asciz "%llu\n"
.text
main:
        call tlmain
        mov rax, r14
        ret
print: // builtin function
        mov rsi, r8
        lea rdi, __print_msg[rip]
        xor eax, eax
        jmp printf@plt
sumnums:
        push rbp
        mov rbp, rsp
        sub rsp, 48
        mov rax, 0
        mov [rbp - 8], rax
        mov rax, 1
        mov [rbp - 16], rax
.L0:
        mov rax, r8
        mov rcx, rax
        mov rax, [rbp - 16]
        cmp rax, rcx
        mov rax, 0
        setbe al
        test rax, rax
        jz .L1
        mov rax, [rbp - 16]
        mov rcx, rax
        mov rax, [rbp - 8]
        add rax, rcx
        mov [rbp - 8], rax
        mov rax, 1
        mov rcx, rax
        mov rax, [rbp - 16]
        add rax, rcx
        mov [rbp - 16], rax
        jmp .L0
.L1:
        mov rax, [rbp - 8]
        mov r14, rax
        leave
        ret
tlmain:
        push rbp
        mov rbp, rsp
        sub rsp, 48
        mov rax, 10
        mov r8, rax
        lea rax, sumnums[rip]
        call rax
        mov rax, r14
        mov r8, rax
        lea rax, print[rip]
        call rax
        mov rax, 0
        mov r14, rax
        leave
        ret