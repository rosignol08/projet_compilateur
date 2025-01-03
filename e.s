.text
.globl main
_add:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  add $v0, $t0, $t1
  jr $ra
main:
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  la $a0, str840920576
  li $v0, 4
  syscall
  la $a0, str485153258
  li $v0, 4
  syscall
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra

.data
str840920576: .asciiz "hello"
str485153258: .asciiz "world"
