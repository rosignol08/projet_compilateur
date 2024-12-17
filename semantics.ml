open Ast
open Baselib

let analyze_expr env expr =
  match expr with
  | Syntax.Int n -> IR.Int n.value

let rec analyze_prog env prog =
  match prog with
  | [] -> []
  | e :: b -> analyze_expr env e :: analyze_prog env b

let analyze prog =
  analyze_prog Baselib.types prog
