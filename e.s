.text
.globl main
_add:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  add $v0, $t0, $t1
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
main:
  addi $sp, $sp, -8
  sw $ra, 4($sp)
  sw $fp, 8($sp)
move $fp, $sp
  li $v0, 10
  sw $v0, -8($fp)
  li $v0, 15
  sw $v0, -12($fp)
if0:
  lw $v0, -8($fp)
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  lw $v0, -12($fp)
  lw $t0, 0($sp)
  addi $sp, $sp, 4
slt $v0, $t0, $v0
  beqz $v0, else0
  la $v0, str0
move $a0, $v0
  li $v0, 4
  syscall
  b endif0
else0:
  la $v0, str1
move $a0, $v0
  li $v0, 4
  syscall
endif0:
if2:
  li $v0, 1
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 10
  lw $t0, 0($sp)
  addi $sp, $sp, 4
slt $v0, $t0, $v0
  beqz $v0, else2
  la $v0, str2
move $a0, $v0
  li $v0, 4
  syscall
  b endif2
else2:
  la $v0, str3
move $a0, $v0
  li $v0, 4
  syscall
endif2:
if4:
  li $v0, 10
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sgt $v0, $t0, $v0
  beqz $v0, else4
  la $v0, str4
move $a0, $v0
  li $v0, 4
  syscall
  b endif4
else4:
  la $v0, str5
move $a0, $v0
  li $v0, 4
  syscall
endif4:
if6:
  li $v0, 10
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 10
  lw $t0, 0($sp)
  addi $sp, $sp, 4
seq $v0, $t0, $v0
  beqz $v0, else6
  la $v0, str6
move $a0, $v0
  li $v0, 4
  syscall
  b endif6
else6:
  la $v0, str7
move $a0, $v0
  li $v0, 4
  syscall
endif6:
if8:
  li $v0, 10
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sne $v0, $t0, $v0
  beqz $v0, else8
  la $v0, str8
move $a0, $v0
  li $v0, 4
  syscall
  b endif8
else8:
  la $v0, str9
move $a0, $v0
  li $v0, 4
  syscall
endif8:
if10:
  li $v0, 5
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sle $v0, $t0, $v0
  beqz $v0, else10
  la $v0, str10
move $a0, $v0
  li $v0, 4
  syscall
  b endif10
else10:
  la $v0, str11
move $a0, $v0
  li $v0, 4
  syscall
endif10:
if12:
  li $v0, 5
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 5
  lw $t0, 0($sp)
  addi $sp, $sp, 4
sge $v0, $t0, $v0
  beqz $v0, else12
  la $v0, str12
move $a0, $v0
  li $v0, 4
  syscall
  b endif12
else12:
  la $v0, str13
move $a0, $v0
  li $v0, 4
  syscall
endif12:
  lw $ra, 4($sp)
  lw $fp, 8($sp)
  addi $sp, $sp, 8
  jr $ra

.data
str1: .asciiz "x est plus grand ou egal a 15"
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
