open Ast.IR
open Baselib
open Mips

let compile_expr env expr =
  match expr with
  | Int n -> Li (V0, n)

let rec compile_prog env prog =
  match prog with
  | [] -> []
  | e :: b -> compile_expr env e :: compile_prog env b

let compile prog =
  { text = compile_prog Baselib.lib prog
  ; data = [] }
