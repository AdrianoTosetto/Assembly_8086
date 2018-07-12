# returns in eax if a number is even or odd, 0 if even, 1 if odd

.section .data

.section .text

.globl _start
_start:

pushl $3

call parity
addl $4, %esp

movl %eax, %ebx
movl $1, %eax
int $0x80

.type parity, @function
parity:
	pushl %ebp           #save old base pointer
	movl  %esp, %ebp     #make stack pointer the base pointer
	subl  $4, %esp       #get room for our local storage
	movl  8(%ebp), %ebx  #put first argument in %eax

	andl $0x1, %ebx
	movl %ebx, %eax

	movl %eax, -4(%ebp)

	movl -4(%ebp), %eax  #return value goes in %eax
	movl %ebp, %esp      #restore the stack pointer
	popl %ebp            #restore the base pointer
	ret
