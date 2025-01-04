open Ast
open Ast.IR
open Baselib

let counter = ref 0
(*let str_env = ref Env.empty*)


exception Error of string * Lexing.position

let expr_pos expr =
  match expr with
  | Syntax.Int n  -> n.pos
  | Syntax.String s -> s.pos
  | Syntax.Bool b -> b.pos
  | Syntax.Var v -> v.pos
  | Syntax.Call c -> c.pos

let errt expected given pos =
  raise (Error (Printf.sprintf "expected %s but given %s"
                  (string_of_t expected)
                  (string_of_t given),
                pos))

(*let nom =*)
(*if Env.mem s.value !str_env then*)
(*Env.find s.value !str_env*)
(*else*)
(*let new_nom = "string" ^ string_of_int !counter in*)
(*incr counter;*)
(*str_env := Env.add s.value new_nom !str_env;*)
(*new_nom*)
(*in*)
(*String nom, String_t*)
let rec analyze_expr env expr =
  match expr with
  | Syntax.Int n -> Int n.value, Int_t
  | Syntax.String s -> String s.value, String_t
  | Syntax.Bool b -> Bool b.value, Bool_t
  | Syntax.Var v ->
    if Env.mem v.name env then
      Var v.name, Env.find v.name env
    else
      raise (Error (Printf.sprintf "unbound variable '%s'" v.name,v.pos))
  | Syntax.Decl d ->
    if Env.mem d.name env then
      raise (Error (Printf.sprintf "variable '%s' already declared" d.name, d.pos))
    else
      Decl (d.name, d.typ), d.typ
  | Syntax.Call c when c.func = "_not" -> (* Ajout ici *)
      if List.length c.args <> 1 then
        raise (Error ("'not' expects 1 argument", c.pos));
      let arg, arg_t = analyze_expr env (List.hd c.args) in
      if arg_t <> Bool_t then
        errt Bool_t arg_t (expr_pos (List.hd c.args));
      Call ("_not", [arg]), Bool_t

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
