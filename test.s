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
  rem $v0, $t0, $t1
  jr $ra
main:
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  la $v0, chaine0
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra

.data
chaine0: .asciiz "El cube est a la base un cube GL4D"
