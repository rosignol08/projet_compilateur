open Ast
open Ast.IR
open Baselib

exception Error of string * Lexing.position

let expr_pos expr =
  match expr with
  | Syntax.Int n  -> n.pos(*n.value, Int_t*)
  | Syntax.Bool b -> b.pos(*b.value, Bool_t*)
  | Syntax.String s -> s.pos(*s.value, String_t*)
  | Syntax.Call c -> raise (Error ("not a value", c.pos))
  | Syntax.Var v -> raise (Error ("not a value", v.pos))

let errt expected given pos =
  raise (Error (Printf.sprintf "expected %s but given %s"
                  (string_of_t expected)
                  (string_of_t given),
                pos))
let analyze_value value =
  match value with
  | Syntax.Int n  -> Syntax.Int n, Int_t
  | Syntax.Bool b -> Syntax.Bool b, Bool_t
  | Syntax.String s -> Syntax.String s, String_t
  | Syntax.Call c -> raise (Error ("not a value", c.pos))
  | Syntax.Var v -> raise (Error ("not a value", v.pos))
                  
let rec analyze_expr env expr =
  match expr with
  | Syntax.Int n -> Int n.value, Int_t (*IR.Int n.value*)
  | Syntax.Bool b -> Bool b.value, Bool_t (*IR.Bool b.value*)
  | Syntax.String s -> String s.value, String_t (*IR.String s.value*)
  | Syntax.Var v -> Var v.name, Env.find v.name env
    | Syntax.Call c ->
      match Env.find_opt c.func env with
      | Some (Func_t (rt, at)) ->
        if List.length at != List.length c.args then
          raise (Error (Printf.sprintf "expected %d arguments but given %d" (List.length at) (List.length c.args), c.pos)) ;
        let args = List.map2 (fun eat a -> let aa, at = analyze_expr a env in if at = eat then aa else errt eat at (expr_pos a)) at c.args in
        Call (c.func, args), rt
      | Some _ -> raise (Error (Printf.sprintf "'%s' is not a function" c.func, c.pos))
      | None -> raise (Error (Printf.sprintf "undefined function '%s'" c.func, c.pos))

  (* | Syntax.Call c when c.func = "_and" || c.func = "_or" ->*)
  (*  let a1, t1 = analyze_expr env (List.nth c.args 0) in*)
  (*  let a2, t2 = analyze_expr env (List.nth c.args 1) in*)
  (*  if t1 <> Bool_t || t2 <> Bool_t then errt Bool_t t1 c.pos;*)
  (*  Call (c.func, [a1; a2]), Bool_t*)
(**)
  (* | Syntax.Call c when c.func = "_not" ->*)
  (*  let a, t = analyze_expr env (List.hd c.args) in*)
  (*  if t <> Bool_t then errt Bool_t t c.pos;*)
  (*  Call (c.func, [a]), Bool_t*)
(**)
  (* | Syntax.String s -> String s.value, String_t*)

let analyze_instr env instr =
  match instr with
  | Syntax.Decl d ->
     Decl d.name, Env.add d.name d.type_t env
  | Syntax.Assign a ->
    if not(Env.mem a.var env ) then
      raise (Error (Printf.sprintf"unbound variable: '%s'" a.var,a.pos));
    let ae, et = analyze_expr env a.expr in
    let t = Env.find a.var env in
    if et <> t then errt t et (expr_pos a.expr);
      Assign (a.var, ae), env
(*test*)
let rec analyze_block block env =
  match block with
  | [] -> []
  | instr :: rest ->
     let ai, new_env = analyze_instr instr env in
     ai :: (analyze_block rest new_env)

(*let rec analyze_prog env prog =*)
(*  match prog with*)
(*  | [] -> []*)
(*  | e :: p ->*)
(*    let ae, _ = analyze_expr env e in*)
(*    ae :: analyze_prog env p*)

let analyze prog =
  analyze_block prog Baselib.types (*TODO changer analyze_block en analyze_prog *)