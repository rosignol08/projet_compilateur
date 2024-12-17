type reg =
  | V0
  | SP
  | T0
  | T1
  | RA

type label = string

type loc =
  | Mem of reg * int
  | Lbl of label

type instr =
  | Li of reg * int
  | Addi of reg * reg * int
  | Sw of reg * loc
  | Jal of loc
  | Lw of loc



type directive =
  | Asciiz of string

type decl = label * directive

type asm = { text : instr list ; data : decl list }

let ps = Printf.sprintf

let fmt_reg = function
  | V0 -> "$v0"
  | SP -> "$sp"
  | T0 -> "$t0"
  | T1 -> "$t1"
  | RA -> "$ra"

  let fmt_loc = function
  | Lbl l -> l
  | Mem (r, o) -> Printf.sprintf "%d(%s)" o (fmt_reg r)

let fmt_instr = function
  | Nop -> "  nop"
  | Li (r, i) ->  ps "  li %s, %d" (fmt_reg r) i
  | Addi (rd, r1, i) -> ps "  addi %s, %s, %d" (fmt_reg rd) (fmt_reg r1) i
  | Add (rd, r1, r2) -> ps "  add %s, %s, %s" (fmt_reg rd) (fmt_reg r1) (fmt_reg r2)
  | Sw (r, l) -> ps "  sw %s, %s" (fmt_reg r) (fmt_loc l)
  | Jal l -> ps "  jal %s" (fmt_loc l)
  | Lw (l, r) -> ps "  lw %s, %s" (fmt_reg l) (fmt_loc r)
  | Label l -> ps "%s:" l
  | Jr r -> ps "  jr %s" (fmt_reg r)
  | 

let fmt_dir = function
  | Asciiz s -> ps ".asciiz \"%s\"" s

let emit oc asm =
  Printf.fprintf oc ".text\n.globl main\nmain:\n" ;
  List.iter (fun i -> Printf.fprintf oc "%s\n" (fmt_instr i)) asm.text ;
  Printf.fprintf oc "  jr $ra\n\n.data\n" ;
  List.iter (fun (l, d) -> Printf.fprintf oc "%s: %s\n" l (fmt_dir d)) asm.data


