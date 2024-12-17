open Ast
open Ast.IR
open Baselib

let expr_pos expr =
  match expr with
  | Syntax.Int n -> n.pos
  | Syntax.Call c -> c.pos


let analyze_expr env expr =
  match expr with
  | Syntax.Int n -> IR.Int n.value
  | Syntax.Call c -> 
    match Env.find_opt c.func env with
      | None -> raise (Error (Printf.sprintf "Fonction '%s' inconue" c.func, c.pos))
      | some (Func_t (rt, ats)) -> let aas = List.map (analyze_expr env) c.args in 
        if List.length c.args <> List.length ats then
          raise (Error (Printf.sprintf "Mauvais nombre d'arguments pour '%s' on en veut '%d' " c.func (List.length ats) (List.length c.args) c.pos));
        let aas = List.fold_left2 (fun aas at aa ->
          let aa, aat = analyze_expr env aa in
          if at <> aa then errt at aat (expr_pos a)
          else aa :: aas) 
          [] ats c.args
        in Call {c.$func, List.rev aas}, rt
      | Some _ -> 
        raise (Error (Printf.sprintf "Fonction '%s' existe pas" c.func, c.pos))
let rec analyze_prog env prog =
  match prog with
  | [] -> []
  | e :: _ -> let ae = analyze_expr env e in ae :: analyze_prog env p

let analyze prog =
  analyze_prog () prog
