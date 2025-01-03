open Ast.IR
open Mips

let string_table = Hashtbl.create 16

let add_string s =
  let lbl = "str" ^ string_of_int (Hashtbl.hash s) in
  if not (Hashtbl.mem string_table lbl) then
    Hashtbl.add string_table lbl s;
  lbl


let rec compile_expr env expr =
  match expr with
  | Int n -> [ Li (V0, n) ]
  (*| Bool b -> [ Li (V0, if b then 1 else 0) ]*)
  | String s ->
    let lbl = add_string s in
    [ La (A0, Lbl lbl) ; Li (V0, 4) ; Syscall ]
  | Call (func, args) ->
    List.concat_map
      (fun a -> compile_expr env a @ [ Addi (SP, SP, -4) ; Sw (V0, Mem (SP, 0)) ])
      args
    @ [ Jal (Lbl func) ; Addi (SP, SP, 4 * List.length args) ]

let rec compile_prog env prog =
  match prog with
  | [] -> []
  | e :: p ->
    let ce = compile_expr env e in
    ce @ compile_prog env p
let compile prog =
  let text =
    Baselib.stdlib
    @ [ Label "main" ; Addi (SP, SP, -4) ; Sw (RA, Mem (SP, 0)) ]
    @ compile_prog () prog
    @ [ Lw (RA, Mem (SP, 0)) ; Addi (SP, SP, 4) ; Jr RA ]
  in
  let data =
    Hashtbl.fold (fun lbl s acc -> (lbl, Asciiz s) :: acc) string_table []
  in
  { text; data }
(*let compile prog =*)
(*  { text = Baselib.stdlib*)
(*    @ [ Label "main" ; Addi (SP, SP, -4) ; Sw (RA, Mem (SP, 0)) ]*)
(*    @ compile_prog () prog*)
(*    @ [ Lw (RA, Mem (SP, 0)) ; Addi (SP, SP, 4) ; Jr RA ]*)
(*  ; data = [] }*)
