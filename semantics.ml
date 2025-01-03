open Ast
open Ast.IR
open Baselib

exception Error of string * Lexing.position

let expr_pos expr =
  match expr with
  | Syntax.Int n  -> n.pos
  | Syntax.String s -> s.pos
  | Syntax.Call c -> c.pos

let errt expected given pos =
  raise (Error (Printf.sprintf "expected %s but given %s"
                  (string_of_t expected)
                  (string_of_t given),
                pos))

let rec analyze_expr env expr =
  match expr with
  | Syntax.Int n -> Int n.value, Int_t
  | Syntax.String s -> String s.value, String_t
  | Syntax.Call c ->
    match Env.find_opt c.func env with
    | None -> raise (Error (Printf.sprintf "unknown function '%s'" c.func, c.pos))
    | Some (Func_t (rt, ats)) ->
      if List.length c.args <> List.length ats then
        raise (Error (Printf.sprintf "arity mismatch for function '%s': expected %d arguments but given %d" c.func (List.length ats) (List.length c.args), c.pos)) ;
      let aas = List.fold_left2
        (fun aas at a ->
          let aa, aat = analyze_expr env a in
          if at <> aat then errt at aat (expr_pos a)
          else aa :: aas)
        [] ats c.args
      in Call (c.func, List.rev aas), rt
    | Some _ ->
      raise (Error (Printf.sprintf "not a function '%s'" c.func, c.pos))

let rec analyze_prog env prog =
  match prog with
  | [] -> []
  | e :: p ->
    let ae, _ = analyze_expr env e in
    ae :: analyze_prog env p

let analyze prog =
  analyze_prog Baselib.types prog
