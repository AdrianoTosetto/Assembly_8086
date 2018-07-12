.section .data

data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,2,66,1


.section .text

.globl _start
_start:
movl $0, %edi
movl data_items(, %edi, 4), %eax
movl %eax, %ebx

loop:
 incl %edi
 movl data_items(, %edi, 4), %eax
 cmpl $1, %eax
 je loop_exit
 cmpl %ebx, %eax
 jge loop
 mov %eax, %ebx

 jmp loop

loop_exit:
	movl $1, %eax
	int $0x80
