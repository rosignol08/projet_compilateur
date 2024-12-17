open Ast.IR
open Baselib
open Mips

let compile_expr env expr =
  match expr with
  | Int n -> [Li (V0, n)]
  | Call (func, args) ->
    List.concat_map (fun a -> compile_expr env a @ [Addi (SP, SP, -4) ; Sw (V0, Mem (SP, 0)) ]) args
    @ [ Jal [Lbl func] ; Addi (SP, SP, 4 * List.length args) ]

let rec compile_prog env prog =
  match prog with
  | [] -> []
  | e :: p -> let ce = compile_expr env e in ce :: compile_prog env p

let compile prog =
  { text = Baselib.stdlib @ compile_prog prog
  ; data = [] }
