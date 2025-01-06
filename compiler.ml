open Ast.IR
open Mips
open Baselib

let string_table = Hashtbl.create 16
let counter = ref 0

type etat_du_compilo = {
  env : int Env.t;   (* Associe les variables à leurs indices *)
  fpo : int;         (* Offset actuel du frame pointer *)
  code : instruction list;  (* Code généré *)
  counter : int;     (* Compteur pour les labels *)
}

(* let add_string s counter =  *)
(*   let lbl = "str" ^ string_of_int !counter in  *)
(*   if not (Hashtbl.mem string_table lbl) then begin  *)
(*     Hashtbl.add string_table lbl s;  *)
(*     incr counter;  *)
(*   end;  *)
(*   lbl  *)

let add_string s counter =
  (* Cherche si la chaîne existe déjà dans la table *)
  let lbl =
    try
      Hashtbl.find string_table s
    with Not_found ->
      let new_lbl = "str" ^ string_of_int !counter in
      Hashtbl.add string_table new_lbl s;
      incr counter;
      new_lbl
  in
  lbl


(* let add_string s counter = *)
(*     let lbl = "str" ^ string_of_int !counter in *)
(*     incr counter; *)
(*     lbl *)


let rec compile_expr etat expr =
  match expr with
  | Int n -> [ Li (V0, n) ]
  | Bool b -> [ Li (V0, if b then 1 else 0) ]
  (* | String s -> let lbl = add_string s counter in *)
  (*   [ La (A0, Lbl lbl) ; Li (V0, 4) ; Syscall ] *)
  | String s ->
    let lbl = add_string s counter in
    [ La (V0, Lbl lbl) ]  (* Charger l'adresse de la chaîne dans $v0 *)
  | Var v -> (
    match Env.find_opt v etat.env with
    | Some offset ->
      Printf.printf "Accès à la variable '%s' à l'offset %d (calculé depuis FP)\n" v offset;
      let loc = Mem (FP, -offset) in
      [ Lw (V0, loc) ]  (* Charge la valeur depuis la pile *)
    | None ->
      failwith (Printf.sprintf "Variable '%s' introuvable" v)
  )
    (*[ Lw (V0, Env.find_opt v env)]*)
    (*( *)
    (*match Env.find v env with*)
    (*| None -> [Addi (SP, SP, -4) ; Sw (V0, Mem (SP, 0))]*)
    (*| Some nom -> [ Lw (V0, Mem (SP, 0)) ; Addi (SP, SP, 4) ])*)
    | Call (func, args) when List.mem func ["_eq"; "_neq"; "_lt"; "_gt"; "_le"; "_ge"] ->
      (* Vérifier que le nombre d'arguments est correct *)
      if List.length args <> 2 then
        failwith (Printf.sprintf "Operator '%s' expects 2 arguments" func);
  
      (* Compiler les arguments gauche et droite *)
      let left = List.nth args 0 in
      let right = List.nth args 1 in
      compile_expr etat left
    @ [ Addi (SP, SP, -4); Sw (V0, Mem (SP, 0)) ]  (* Empiler la valeur gauche *)
    @ compile_expr etat right
    @ [ Lw (T0, Mem (SP, 0)); Addi (SP, SP, 4) ]  (* Dépiler la valeur gauche dans T0 *)
    @ (match func with
        | "_eq" -> [ Seq (V0, T0, V0) ]  (* V0 = (T0 == V0) *)
        | "_neq" -> [ Sne (V0, T0, V0) ] (* V0 = (T0 != V0) *)
        | "_lt" -> [ Slt (V0, T0, V0) ]  (* V0 = (T0 < V0) *)
        | "_gt" -> [ Sgt (V0, T0, V0) ]  (* V0 = (T0 > V0) *)
        | "_le" -> [ Sle (V0, T0, V0) ]  (* V0 = (T0 <= V0) *)
        | "_ge" -> [ Sge (V0, T0, V0) ]  (* V0 = (T0 >= V0) *)
        | _ -> failwith "Unsupported operator")
    (*@ [ Jal (Lbl func) ] *)  (* Appeler la fonction *)
      (*compile_expr etat left *)
      (*@ [ Addi (SP, SP, -4); Sw (V0, Mem (SP, 0)) ]  (* Empiler la valeur gauche *) *)
      (*@ compile_expr etat right *)
      (*@ [ Lw (T0, Mem (SP, 0)); Addi (SP, SP, 4) ]  (* Dépiler la valeur gauche dans T0 *) *)
      (*@ (match func with *)
      (*   | "%eq" -> [ Seq (V0, T0, V0) ]  (* V0 = (T0 == V0) *) *)
      (*   | "%neq" -> [ Sne (V0, T0, V0) ] (* V0 = (T0 != V0) *) *)
      (*   | "%lt" -> [ Slt (V0, T0, V0) ]  (* V0 = (T0 < V0) *) *)
      (*   | "%gt" -> [ Sgt (V0, T0, V0) ]  (* V0 = (T0 > V0) *) *)
      (*   | "%le" -> [ Sle (V0, T0, V0) ]  (* V0 = (T0 <= V0) *) *)
      (*   | "%ge" -> [ Sge (V0, T0, V0) ]  (* V0 = (T0 >= V0) *) *)
      (*   | _ -> failwith "Unsupported operator") *)
  
    | Call (func, args) ->
    List.concat_map
      (fun a -> compile_expr etat a @ [ Addi (SP, SP, -4) ; Sw (V0, Mem (SP, 0)) ])
      args
    @ [ Jal (Lbl func) ; Addi (SP, SP, 4 * List.length args) ]

let rec compile_instr etat instr =
  match instr with
  | Decl name ->
      if Env.mem name etat.env then
        failwith (Printf.sprintf "Variable '%s' is already declared" name)
      else
        
        (*let offset = etat.fpo in *)  (* le fpo actuel *)
        let offset = etat.fpo + 4 in
        let env = Env.add name offset etat.env in
        let etat = { etat with env; fpo = etat.fpo + 4 } in  (* avance fpo de 4 pour la prochaine variable *)
        Printf.printf "Ajout de la variable '%s' avec l'offset -%d\n" name offset;
        (* Ajout de la variable à l'environnement *)
        (* let env = Env.add name etat.fpo etat.env in *)
        (* let etat = { etat with env; fpo = etat.fpo + 4 } in *)
        (* ça réserve de l'espace dans la pile *)
        (*[ Addi (SP, SP, -4) ]*)[], etat
        

        
  | Assigne (name, expr) ->
    let offset =
      match Env.find_opt name etat.env with
      | Some o -> Mem (FP, -o)  (* Convertir l'offset en loc *)
      | None -> failwith (Printf.sprintf "La variable '%s' pas trouvee" name)
    in
    let offset_int = (match offset with Mem (_, off) -> off | _ -> failwith "Unexpected offset type" )in
    Printf.printf "Assignation à la variable '%s' à l'offset %d (calculé depuis FP)\n" name offset_int;
    compile_expr etat expr
    @ [ Sw (V0, offset) ], etat  (* Utiliser loc ici *)
  
    | DeclAssigne (name, expr) ->
      let offset = etat.fpo in  (* Calculer l'offset actuel *)
      let env = Env.add name offset etat.env in
      let etat = { etat with env; fpo = etat.fpo + 4 } in  (* Incrémenter après *)
      Printf.printf "Ajout de la variable '%s' avec l'offset -%d\n" name offset;
      compile_expr etat expr  (* Compiler l'expression *)
      @ [ Sw (V0, Mem (FP, -offset)) ],etat  (* Utiliser l'offset réservé *)
  

  
  (*| Retourne expr -> *)
  (*  (* failwith "Not implemented" *) *)
  (*  let code_expr = compile_expr etat.env expr in  *)
  (*  let code_retour = [  *)
  (*      Lw (RA, Mem (SP, 0));  *)
  (*      Addi (SP, SP, 4);  *)
  (*      Jr RA  *)
  (*    ] in  *)
    (*code_expr @ code_retour, etat  *)
  | Print ( expr, type_) ->
    let code_expr = compile_expr etat expr in
    let code_print = match type_ with
      | Int_t ->
        Printf.printf "chercher à l'adresse %d\n" etat.fpo; 
        [ Move (A0, V0)  (* Déplacer l'entier dans $a0 *)
                 ; Li (V0, 1)     (* Syscall pour afficher un entier *)
                 ; Syscall ]
      | Bool_t -> [ Move (A0, V0)  (* Déplacer le booléen dans $a0 *)
                  ; Li (V0, 1)     (* Syscall pour afficher un entier (0 ou 1) *)
                  ; Syscall ]
      | String_t -> [ Move (A0, V0) (* Déplacer l'adresse de la chaîne dans $a0 *)
                 ; Li (V0, 4) (* Syscall pour afficher une chaîne *)
                 ; Syscall ]
      | _ -> failwith "Type pas supporte pour Print"
    in
    code_expr @ code_print , etat
    | Condition (compar, tblock, fblock) ->
      let uniq = string_of_int etat.counter in
      let updated_counter = etat.counter + 1 in
      let true_code, true_state =
        if tblock = [] then [], etat
        else compile_block { etat with counter = updated_counter } tblock
      in
      let false_code, false_state =
        if fblock = [] then [], true_state
        else compile_block { true_state with counter = true_state.counter + 1 } fblock
      in
      ([ Label ("if" ^ uniq) ]
       @ compile_expr etat compar
       @ [ Beqz (V0, "else" ^ uniq) ]  (* Sauter au bloc else si la condition est fausse *)
       @ true_code
       @ [ B ("endif" ^ uniq); Label ("else" ^ uniq) ]  (* Sauter à la fin après le bloc then *)
       @ false_code
       @ [ Label ("endif" ^ uniq) ],
       { false_state with counter = false_state.counter })
  
  
  
  (*| Entree (prompt, var) -> *)
  (*  let code_prompt = [ La (A0, Lbl (add_string prompt counter)) *)
  (*                    ; Li (V0, 4)   *)
  (*                    ; Syscall ] *)
  (*  in *)
  (*  let code_read = [ Li (V0, 5) *)
  (*                  ; Syscall *)
  (*                  ; Sw (V0, Mem (FP, - (Env.find var etat.env))) *)
  (*                  ] *)
  (*  in *)
  (*  code_prompt @ code_read , etat *)
  
and compile_block state block =
  match block with
  | [] -> [], state
  | instr :: rest ->
      let ci, new_state = compile_instr state instr in
      let cb, final_state = compile_block new_state rest in
      (ci @ cb), final_state
  

let rec compile_prog state prog =
  match prog with
  | [] -> []
  | e :: p ->
    let ce , nouvel_env = compile_instr state e in
    ce @ compile_prog nouvel_env p
let initial_env = Env.empty;;

let etat_initial = { env = Env.empty; fpo = 8 ; code = [] ; counter = 0 }

let compile prog =
  let text =
    Baselib.stdlib
    (*; Move (FP, SP)*)
    @ [ Label "main"
    ; Addi (SP, SP, -etat_initial.fpo) 
    ; Sw (RA, Mem (SP, etat_initial.fpo - 4))
    ; Sw (FP, Mem (SP, etat_initial.fpo))
    ; Move (FP, SP)
    (*; Addi (FP, SP, etat_initial.fpo - 4) *)
    ]
    @ compile_prog etat_initial prog (*verif si ça marche*)
    @ [Lw (RA, Mem (SP, etat_initial.fpo - 4))
    ; Lw (FP, Mem (SP, etat_initial.fpo))
    ; Addi (SP, SP, etat_initial.fpo) 
    ; Jr RA ]
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
