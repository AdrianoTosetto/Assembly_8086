.section .data

data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0


.section .text

.globl _start
_start:
movl $0, %ebx
movl $0x1234567, %eax
movzwl %ax, %ebx
loop_exit:
	movl $1, %eax
	int $0x80
