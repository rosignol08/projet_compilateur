open Ast.IR
open Mips
let string_table = Hashtbl.create 16

let add_string s =
  let lbl = "str" ^ string_of_int (Hashtbl.hash s) in
  if not (Hashtbl.mem string_table lbl) then
    Hashtbl.add string_table lbl s;
  lbl

(* test*)

let rec compile_expr env expr =
  match expr with
  | Var v -> [ Lw (V0, Mem (SP, 0)) ] (*TODO verifier que ça fonctionne*)
  | Int n -> [ Li (V0, n) ]
  | Bool b -> [ Li (V0, if b then 1 else 0) ]
  | String s ->
    let lbl = add_string s in
    [ La (A0, Lbl lbl) ; Li (V0, 4) ; Syscall ]
  | Call (func, args) ->
    (match func with
    | _ -> (* Autres appels à des fonctions normales *)
      List.concat_map (fun a -> compile_expr env a @ [ Addi (SP, SP, -4); Sw (V0, Mem (SP, 0)) ]) args
      @ [ Jal (Lbl func); Addi (SP, SP, 4 * List.length args)
  ])

(*test*)
(* Compile une instruction en MIPS *)
let rec compile_instr env instr =
  match instr with
  | Decl _ ->
    (* On suppose que la variable doit être initialisée à 0 dans la pile *)
    [ Addi (SP, SP, -4); Sw (ZERO, Mem (SP, 0)) ] 
    (* Réserve 4 octets sur la pile et initialise la variable à 0 *)
    | Assigne (_, expr) ->
      (* Compile l'expression et stocke le résultat dans la variable *)
      compile_expr env expr @ [ Sw (V0, Mem (SP, 0)) ]
      (* On suppose que la variable est à l'adresse SP + offset dans l'environnement *)
  
    | Return expr ->
      (* Compile l'expression et effectue un saut vers l'appelant *)
      compile_expr env expr @ [ Jr RA ]

(* Compiler un bloc d'instructions et d'expressions *)
let rec compile_block env block =
  match block with
  | [] -> []
  | instr :: rest ->
    let ci = compile_instr env instr in
    ci @ compile_block env rest

(* Compiler un programme complet (une liste d'instructions et d'expressions) *)
let rec compile_prog env prog =
  match prog with
  | [] -> []
  | e :: p -> compile_instr env e @ compile_prog env p


(*let rec compile_prog env prog =*)
(*  match prog with*)
(*  | [] -> []*)
(*  | e :: p ->*)
(*    let ce = compile_expr env e in*)
(*    ce @ compile_prog env p*)
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
  (*{ text = Baselib.stdlib*)
  (*  @ [ Label "main" ; Addi (SP, SP, -4) ; Sw (RA, Mem (SP, 0)) ]*)
  (*  @ compile_prog () prog*)
  (*  @ [ Lw (RA, Mem (SP, 0)) ; Addi (SP, SP, 4) ; Jr RA ]*)
  (*; data = [] }*)
