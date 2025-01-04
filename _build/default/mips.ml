type label = string

type reg =
| V0
| A0
| SP
| FP
| T0
| T1
| RA
| ZERO


type loc =
| Lbl of label
| Mem of reg * int

type instr =
| Nop
| Label of label
| Li of reg * int
| La of reg * loc
| Addi of reg * reg * int
| Add of reg * reg * reg
| Sw of reg * loc
| Lw of reg * loc
| Jal of loc
| Jr of reg
| And of reg * reg * reg
| Or of reg * reg * reg
| Not of reg * reg
| Syscall

type directive =
| Asciiz of string

type decl = label * directive

type mips = { text : instr list ; data : decl list }

let fmt_reg = function
  | V0 -> "$v0"
  | A0 -> "$a0"
  | SP -> "$sp"
  | FP -> "$fp"
  | T0 -> "$t0"
  | T1 -> "$t1"
  | RA -> "$ra"
  | ZERO -> "$zero"

let fmt_loc = function
  | Lbl l -> l
  | Mem (r, o) -> Printf.sprintf "%d(%s)" o (fmt_reg r)

let fmt_instr = function
  | Nop              -> "  nop"
  | Label l          -> Printf.sprintf "%s:" l
  | Li (r, i)        -> Printf.sprintf "  li %s, %d" (fmt_reg r) i
  | La (r, l)        -> Printf.sprintf "  la %s, %s" (fmt_reg r) (fmt_loc l)
  | Addi (rd, r, i)  -> Printf.sprintf "  addi %s, %s, %d" (fmt_reg rd) (fmt_reg r) i
  | Add (rd, r1, r2) -> Printf.sprintf "  add %s, %s, %s" (fmt_reg rd) (fmt_reg r1) (fmt_reg r2)
  | Sw (r, l)        -> Printf.sprintf "  sw %s, %s" (fmt_reg r) (fmt_loc l)
  | Lw (r, l)        -> Printf.sprintf "  lw %s, %s" (fmt_reg r) (fmt_loc l)
  | Jal l            -> Printf.sprintf "  jal %s" (fmt_loc l)
  | Jr r             -> Printf.sprintf "  jr %s" (fmt_reg r)
  | And (rd, r1, r2) -> Printf.sprintf "  and %s, %s, %s" (fmt_reg rd) (fmt_reg r1) (fmt_reg r2)
  | Or (rd, r1, r2)  -> Printf.sprintf "  or %s, %s, %s" (fmt_reg rd) (fmt_reg r1) (fmt_reg r2)
  | Not (rd, r)      -> Printf.sprintf "  not %s, %s" (fmt_reg rd) (fmt_reg r)
  | Syscall          -> "  syscall"

let fmt_dir = function
  | Asciiz s -> Printf.sprintf ".asciiz \"%s\"" s

let emit oc asm =
  Printf.fprintf oc ".text\n.globl main\n" ;
  List.iter (fun i -> Printf.fprintf oc "%s\n" (fmt_instr i)) asm.text ;
  Printf.fprintf oc "\n.data\n" ;
  List.iter (fun (l, d) -> Printf.fprintf oc "%s: %s\n" l (fmt_dir d)) asm.data;


