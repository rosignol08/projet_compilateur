.text
.globl main
_add:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  add $v0, $t0, $t1
  jr $ra
main:
  addi $sp, $sp, -8
  sw $ra, 4($sp)
  sw $fp, 8($sp)
move $fp, $sp
  li $v0, 42
  sw $v0, -12($fp)
  li $v0, 1
  sw $v0, -16($fp)
  lw $v0, -12($fp)
move $a0, $v0
  li $v0, 1
  syscall
  la $v0, str0
move $a0, $v0
  li $v0, 4
  syscall
  lw $v0, -16($fp)
move $a0, $v0
  li $v0, 1
  syscall
  lw $ra, 4($sp)
  lw $fp, 8($sp)
  addi $sp, $sp, 8
  jr $ra

.data
str0: .asciiz "\n"
