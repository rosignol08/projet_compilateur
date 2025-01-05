open Ast.IR
open Mips
open Baselib

let string_table = Hashtbl.create 16
let counter = ref 0

type etat_du_compilo = {
  env : int Env.t;   (* Associe les variables à leurs indices *)
  fpo : int;         (* Offset actuel du frame pointer *)
}

let add_string s counter =
  let lbl = "str" ^ string_of_int !counter in
  if not (Hashtbl.mem string_table lbl) then begin
    Hashtbl.add string_table lbl s;
    incr counter;
  end;
  lbl

let rec compile_expr (env : int Env.t) expr =
  match expr with
  | Int n -> [ Li (V0, n) ]
  | Bool b -> [ Li (V0, if b then 1 else 0) ]
  | String s -> let lbl = add_string s counter in
    [ La (A0, Lbl lbl) ; Li (V0, 4) ; Syscall ]
    | Var v -> (
      match Env.find_opt v env with
      | Some offset ->
          let loc = Mem (FP, -offset) in
          [ Lw (V0, loc) ]  (* Charge la valeur depuis la pile *)
      | None ->
          failwith (Printf.sprintf "Variable '%s' not found" v)
    )
    (*[ Lw (V0, Env.find_opt v env)]*)
    (*( *)
    (*match Env.find v env with*)
    (*| None -> [Addi (SP, SP, -4) ; Sw (V0, Mem (SP, 0))]*)
    (*| Some nom -> [ Lw (V0, Mem (SP, 0)) ; Addi (SP, SP, 4) ])*)
  | Call (func, args) ->
    List.concat_map
      (fun a -> compile_expr env a @ [ Addi (SP, SP, -4) ; Sw (V0, Mem (SP, 0)) ])
      args
    @ [ Jal (Lbl func) ; Addi (SP, SP, 4 * List.length args) ]

let rec compile_instr etat instr =
  match instr with
  | Decl name ->
      if Env.mem name etat.env then
        failwith (Printf.sprintf "Variable '%s' is already declared" name)
      else
        (* Ajout de la variable à l'environnement *)
        let env = Env.add name etat.fpo etat.env in
        let etat = { etat with env; fpo = etat.fpo + 4 } in
        (* ça réserve de l'espace dans la pile *)
        [ Addi (SP, SP, -4) ], etat
  | Assigne (name, expr) ->
    let offset =
      match Env.find_opt name etat.env with
      | Some o -> Mem (FP, -o)  (* Convertir l'offset en loc *)
      | None -> failwith (Printf.sprintf "La variable '%s' pas trouvee" name)
    in
    compile_expr etat.env expr
    @ [ Sw (V0, offset) ], etat  (* Utiliser loc ici *)
      

let rec compile_prog state prog =
  match prog with
  | [] -> []
  | e :: p ->
    let ce , nouvel_env = compile_instr state e in
    ce @ compile_prog nouvel_env p
let initial_env = Env.empty;;

let etat_initial = { env = Env.empty; fpo = 0 }

let compile prog =
  let text =
    Baselib.stdlib
    @ [ Label "main" ; Addi (SP, SP, -4) ; Sw (RA, Mem (SP, 0)) ]
    @ compile_prog etat_initial prog (*verif si ça marche*)
    @ [ Lw (RA, Mem (SP, 0)) ; Addi (SP, SP, 4) ; Jr RA ]
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
