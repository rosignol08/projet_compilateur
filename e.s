.text
.globl main
_add:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  add $v0, $t0, $t1
  jr $ra
_and:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  and $v0, $t0, $t1
  jr $ra
_or:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  or $v0, $t0, $t1
  jr $ra
_not:
  lw $a0, 0($sp)
  not $v0, $t0
  jr $ra
_assign_string:
  lw $t0, 0($sp)
  sw $t0, 4($sp)
  jr $ra
_print_string:
  lw $a0, 0($sp)
  li $v0, 4
  syscall
  jr $ra
main:
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  la $a0, str1053319576
  li $v0, 4
  syscall
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra

.data
str1053319576: .asciiz "hello world"
