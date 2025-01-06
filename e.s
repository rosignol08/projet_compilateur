.text
.globl main
_add:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  add $v0, $t0, $t1
  jr $ra
_sub:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
sub $v0, $t0, $t1
  jr $ra
_mul:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
mul $v0, $t0, $t1
  jr $ra
_div:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
div $v0, $t0, $t1
  jr $ra
_mod:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
div $t2, $t0, $t1
mfhi $v0
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
_xor:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
xor $v0, $t0, $t1
  jr $ra
_lt:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
slt $v0, $t0, $t1
  jr $ra
_gt:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
sgt $v0, $t0, $t1
  jr $ra
_eq:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
seq $v0, $t0, $t1
  jr $ra
_neq:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
sne $v0, $t0, $t1
  jr $ra
_le:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
sle $v0, $t0, $t1
  jr $ra
_ge:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
sge $v0, $t0, $t1
  jr $ra
main_entry0:
  jal main
  li $v0, 10
  syscall
main:
  addi $sp, $sp, -16
  sw $ra, 12($sp)
  sw $fp, 8($sp)
move $fp, $sp
  li $v0, 42
  sw $v0, -4($fp)
  li $v0, 9
  sw $v0, -8($fp)
  li $v0, 42
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 9
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  jal _add
  addi $sp, $sp, 8
  sw $v0, -12($fp)
  lw $v0, -12($fp)
move $a0, $v0
  li $v0, 1
  syscall
  lw $ra, 12($sp)
  lw $fp, 8($sp)
  addi $sp, $sp, 16
  jr $ra

.data
