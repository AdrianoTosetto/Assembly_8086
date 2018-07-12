.section .data



.section .text

.globl _start
_start:

pushl $30
pushl $5

call sum
addl $8, %esp

movl %eax, %ebx
movl $1, %eax
int $0x80

.type sum, @function
sum:
	pushl %ebp           #save old base pointer
	movl  %esp, %ebp     #make stack pointer the base pointer
	subl  $4, %esp       #get room for our local storage
	movl  8(%ebp), %ebx  #put first argument in %eax
	movl  12(%ebp), %ecx #put second argument in %ecx

	movl %ebx, %eax
	addl %ecx, %eax

	movl %eax, -4(%ebp)

	movl -4(%ebp), %eax  #return value goes in %eax
	movl %ebp, %esp      #restore the stack pointer
	popl %ebp            #restore the base pointer
	ret
