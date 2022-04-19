%include "syscall.mac"
SECTION .text
GLOBAL _start
_start:
mov eax, 7
mov ecx, 0
cpuid
mov eax, 1<<8
and eax, ebx
jz n1
WRITE BMI2, BMI2.len
step2:
mov eax, 7
mov ecx, 0
cpuid
mov eax, 1<<19
and eax, ebx
jz n2
WRITE ADX, ADX.len
EXIT
n1:
WRITE BMI2_NO, BMI2_NO.len
jmp step2
n2:
WRITE ADX_NO, ADX_NO.len
EXIT
SECTION .data
BMI2: DB "BMI2 - Присутсвует", 0xA
.len: EQU $ - BMI2
BMI2_NO: DB "BMI2 - Отсутсвует", 0xA
.len: EQU $ - BMI2_NO
ADX: DB "ADX - Присутсвует", 0xA
.len: EQU $ - ADX
ADX_NO: DB "ADX - Отсутсвует", 0xA
.len: EQU $ - ADX_NO