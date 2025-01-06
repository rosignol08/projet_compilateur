open Ast
open Ast.IR
open Baselib


let string_of_type_t = function
  | Int_t -> "int"
  | Bool_t -> "bool"
  | String_t -> "string"
  | Func_t (_, _) -> "function"

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
      raise (Error (Printf.sprintf "Variable non déclaree '%s'" v.name,v.pos))
  | Syntax.Call c when List.mem c.func ["_eq"; "_neq"; "_lt"; "_gt"; "_le"; "_ge"] ->
    (* Vérifiez que le nombre d'arguments est correct *)
    if List.length c.args <> 2 then
      raise (Error (Printf.sprintf "Operator '%s' demande 2 arguments" c.func, c.pos));
    let lhs, lhs_t = analyze_expr env (List.nth c.args 0) in
    let rhs, rhs_t = analyze_expr env (List.nth c.args 1) in
    (* Vérifiez que les opérandes sont des entiers *)
    if lhs_t <> Int_t || rhs_t <> Int_t then
      raise (Error ("Operands must be integers for comparison operators", c.pos));
    Call (c.func, [lhs; rhs]), Bool_t
    
  | Syntax.Call c when c.func = "_not" -> (* Ajout ici pour le NOT *)
      if List.length c.args <> 1 then
        raise (Error ("'not' expects 1 argument", c.pos));
      let arg, arg_t = analyze_expr env (List.hd c.args) in
      if arg_t <> Bool_t then
        errt Bool_t arg_t (expr_pos (List.hd c.args));
      Call ("_not", [arg]), Bool_t
  
  | Syntax.Call c -> (* Cas général pour d'autres appels *)
      match Env.find_opt c.func env with
      | None -> raise (Error (Printf.sprintf "unknown function '%s'" c.func, c.pos))
      | Some (Func_t (rt, ats)) ->
          if List.length c.args <> List.length ats then
            raise (Error (Printf.sprintf "arity mismatch for function '%s': expected %d arguments but given %d" c.func (List.length ats) (List.length c.args), c.pos));
          let args = List.fold_left2
            (fun acc at a ->
              let arg, arg_t = analyze_expr env a in
              if at <> arg_t then errt at arg_t (expr_pos a)
              else arg :: acc)
            [] ats c.args
          in
          Call (c.func, List.rev args), rt
      | Some _ -> raise (Error (Printf.sprintf "'%s' is not a function" c.func, c.pos))
    
    
let rec analyze_instr env instr la_pile =
  match instr with
    | Syntax.Decl d ->
      if Env.mem d.name env then
        raise (Error (Printf.sprintf "variable '%s' est deja declaree" d.name, d.pos))
      else
        let nouvel_env = Env.add d.name d.typ env in
        (*Printf.printf "Ajout de la variable '%s' avec le type '%s'\n"
          d.name (string_of_t d.typ);
        *)
        Decl d.name, nouvel_env

    | Syntax.Assigne a ->
      if not (Env.mem a.name env) then
        raise (Error (Printf.sprintf "on a pas trouve la variable '%s'" a.name, a.pos));
      (*let e, et = analyze_expr env a.expr in *)
      (*if et <> Env.find a.name env then *)
      (*  errt (Env.find a.name env) et (expr_pos a.expr); *)
      (*Assigne (a.name, e), env *)
      let t = Env.find a.name env in
      let ae, et = analyze_expr env a.expr in
      if et = t then
        Assigne (a.name, ae), env
      else
        errt t et (expr_pos a.expr)
    | Syntax.DeclAssigne da ->
      if Env.mem da.name env then
        raise (Error (Printf.sprintf "Variable '%s' est deja declaree" da.name, da.pos))
      else
        let ae, et = analyze_expr env da.expr in
        if et = da.typ then
          let nouvel_env = Env.add da.name da.typ env in
          DeclAssigne (da.name, ae), nouvel_env
        else
          errt da.typ et da.pos
        
    (*| Syntax.Retourne r -> *)
    (*  failwith "Not implemented" *)
      (* let ae, et = analyze_expr env r.expr in *)
      (* let sortie_pile = Pile.pop stack in *)
      (* if (et == sortie_pile) then *)
      (*   Retourne ae, env  *)
      (* else *)
      (*   errt sortie_pile et (expr_pos r.expr) *)
    | Syntax.Print p ->
      let ae, et = analyze_expr env p.expr in
      begin
      match et with
      | Int_t | Bool_t | String_t -> Print (ae, et), env
      | _ -> raise (Error (Printf.sprintf "Type pas supporte par print: %s" (string_of_type_t et), p.pos))
      end

    | Syntax.Condition c ->
      let compar, compar_type = analyze_expr env c.compar in
      if compar_type <> Bool_t then
        raise (Error ("Condition doit etre un booleen", expr_pos c.compar));
      let true_block, env_t = analyze_block env c.tblock la_pile in
      let false_block, env_f = analyze_block env_t c.fblock la_pile in
      Condition (compar, true_block, false_block), env_f
    | Syntax.Boucle l ->
      let condition, condition_type = analyze_expr env l.expr in
      if condition_type <> Bool_t then
        raise (Error ("Condition must evaluate to a boolean", expr_pos l.expr));
      let boucle_block, env_in_boucle = analyze_block env l.b la_pile in
      Boucle (condition, boucle_block), env_in_boucle
    
  
(*  | Syntax.Entree e -> *)
(*    let var_name = match e.var with *)
(*      | Var { name; _ } -> name *)
(*      | _ -> raise (Error ("Expected a variable in Entree", e.pos)) *)
(*    in *)
(*    if not (Env.mem var_name env) then *)
(*      raise (Error (Printf.sprintf "Variable '%s' is not declared" var_name, e.pos)) *)
(*    else *)
(*      let var_typ = Env.find var_name env in *)
(*      if var_typ = Int_t || var_typ = Str_t then *)
(*        IR.Entree (e.prompt, var_name), env *)
(*      else *)
(*        raise (Error (Printf.sprintf "Unsupported type for variable '%s'" var_name, e.pos)) *)
  | Syntax.Entree _ -> failwith "Unhandled instruction"

and analyze_block env block la_pile =
  match block with
  | [] -> [], env
  | instr :: rest ->
      let analyzed_instr, new_env = analyze_instr env instr la_pile in
      let analyzed_rest, final_env = analyze_block new_env rest la_pile in
      (analyzed_instr :: analyzed_rest, final_env)
let analyze_func env func la_pile =
  match func with
  | Syntax.Func f ->
    let args = [] in
    let la_pile = Stack.push f.typ la_pile in
      
      (* Construisez l'environnement pour les arguments *)
      let new_env = List.fold_left (fun acc arg ->
        if Env.mem arg acc then
          raise (Error (Printf.sprintf "Duplicate argument '%s'" arg, f.pos))
        else
          Env.add arg Int_t acc (* TODO : gérer les types des arguments si nécessaire *)
      ) env f.args in

      (* Analysez le bloc de la fonction *)
      let block, final_env = analyze_block new_env f.block la_pile in

      (* Vérifiez si la fonction existe déjà dans l'environnement *)
      IR.Func (f.typ, f.name, f.args, block),
      if Env.mem f.name env then
        raise (Error (Printf.sprintf "Function '%s' deja definie" f.name, f.pos))
      else
        Env.add f.name (Func_t (f.typ, List.map (fun _ -> Int_t) f.args)) env
      

(* let rec analyze_prog env prog la_pile= *)
(*   match prog with *)
(*   | [] -> [] *)
(*   | e :: p -> *)
(*     let ae, nouvel_env = analyze_func env e la_pile in *)
(*     ae :: analyze_prog nouvel_env p la_pile *)

let analyze_prog env prog stack =
  (* Vérifie que 'main' existe *)
  let has_main = List.exists (function
    | Syntax.Func f when f.name = "main" -> true
    | _ -> false
  ) prog in

  if not has_main then
    raise (Error ("Le programme doit contenir une fonction 'main' sans arguments de type int", Lexing.dummy_pos));

  (* Analyse chaque fonction ou instruction *)
  let rec analyze_all env prog stack =
    match prog with
    | [] -> [], env
    | func :: rest ->
      let analyzed_func, new_env = analyze_func env func stack in
      let analyzed_rest, final_env = analyze_all new_env rest stack in
      analyzed_func :: analyzed_rest, final_env
  in

  analyze_all env prog stack


(* let analyze prog = *)
(*   analyze_prog Baselib.types prog (Stack.create()) *)
let analyze prog =
  let ir, _ = analyze_prog Baselib.types prog (Stack.create()) in
  ir
