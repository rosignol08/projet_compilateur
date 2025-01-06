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
  li $v0, 10
  sw $v0, 0($fp)
  li $v0, 15
  sw $v0, -4($fp)
if1:
  lw $v0, 0($fp)
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  lw $v0, -4($fp)
  lw $t0, 0($sp)
  addi $sp, $sp, 4
slt $v0, $t0, $v0
  beqz $v0, else1
  la $v0, str0
move $a0, $v0
  li $v0, 4
  syscall
  b endif1
else1:
  la $v0, str1
move $a0, $v0
  li $v0, 4
  syscall
endif1:
if3:
  li $v0, 1
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 10
  lw $t0, 0($sp)
  addi $sp, $sp, 4
slt $v0, $t0, $v0
  beqz $v0, else3
  la $v0, str2
move $a0, $v0
  li $v0, 4
  syscall
  b endif3
else3:
  la $v0, str3
move $a0, $v0
  li $v0, 4
  syscall
endif3:
if5:
  li $v0, 10
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sgt $v0, $t0, $v0
  beqz $v0, else5
  la $v0, str4
move $a0, $v0
  li $v0, 4
  syscall
  b endif5
else5:
  la $v0, str5
move $a0, $v0
  li $v0, 4
  syscall
endif5:
if7:
  li $v0, 10
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 10
  lw $t0, 0($sp)
  addi $sp, $sp, 4
seq $v0, $t0, $v0
  beqz $v0, else7
  la $v0, str6
move $a0, $v0
  li $v0, 4
  syscall
  b endif7
else7:
  la $v0, str7
move $a0, $v0
  li $v0, 4
  syscall
endif7:
if9:
  li $v0, 10
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sne $v0, $t0, $v0
  beqz $v0, else9
  la $v0, str8
move $a0, $v0
  li $v0, 4
  syscall
  b endif9
else9:
  la $v0, str9
move $a0, $v0
  li $v0, 4
  syscall
endif9:
if11:
  li $v0, 5
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sle $v0, $t0, $v0
  beqz $v0, else11
  la $v0, str10
move $a0, $v0
  li $v0, 4
  syscall
  b endif11
else11:
  la $v0, str11
move $a0, $v0
  li $v0, 4
  syscall
endif11:
if13:
  li $v0, 5
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sge $v0, $t0, $v0
  beqz $v0, else13
  la $v0, str12
move $a0, $v0
  li $v0, 4
  syscall
  b endif13
else13:
  la $v0, str13
move $a0, $v0
  li $v0, 4
  syscall
endif13:
  lw $ra, 12($sp)
  lw $fp, 8($sp)
  addi $sp, $sp, 16
  jr $ra

.data
str1: .asciiz "x est plus grand ou egal a 15\n"
str3: .asciiz "chelou"
str0: .asciiz "x est plus petit que y"
str6: .asciiz "10 egale a 10 \n"
str2: .asciiz "1 plus petit que 10 \n"
str12: .asciiz "5 plus petit ou egal a 5 \n"
str9: .asciiz "chelou"
str7: .asciiz "chelou"
str5: .asciiz "chelou"
str8: .asciiz "10 different de 5 \n"
str13: .asciiz "chelou"
str4: .asciiz "10 plus grands que 5 \n"
str10: .asciiz "5 plus petit ou egal a 5 \n"
str11: .asciiz "chelou"
