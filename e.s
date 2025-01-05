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
  li $v0, 42
move $a0, $v0
  li $v0, 1
  syscall
  la $v0, str0
move $a0, $v0
  li $v0, 4
  syscall
  li $v0, 1
move $a0, $v0
  li $v0, 1
  syscall
  la $v0, str1
move $a0, $v0
  li $v0, 4
  syscall
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra

.data
str1: .asciiz "\n Hello! world"
str0: .asciiz "\n"
