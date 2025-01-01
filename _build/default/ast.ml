type base_t =
  | Int_t
  | Bool_t
  | String_t
  | Func_t of base_t * base_t list

let rec string_of_t = function
  | Int_t -> "int"
  | Bool_t -> "bool"
  | String_t -> "string"
  | Func_t (rt, ats) ->
    Printf.sprintf "(%s) -> %s"
      (String.concat ", " (List.map string_of_t ats))
      (string_of_t rt)

module Syntax = struct
  type ident = string
  type expr =
  | Int of { value : int ; pos : Lexing.position }
  | Bool of { value : bool; pos : Lexing.position }
  | String of { value : string; pos : Lexing.position }
  | Var of { name : ident ; pos : Lexing.position }
  | Call of { func : ident ; args : expr list; pos : Lexing.position }(*TODO à changer en expr list*)

  type instr =
  | Decl of { var: ident ; base_t: base_t ; pos: Lexing.position }
  | Assigne of { var: ident ; expr: expr ; pos: Lexing.position }
  | Return of { expr: expr; pos: Lexing.position } (* Retour d'une expression *)
  (*| If of expr * block * block *) (* Branchement conditionnel *)
  (*| While of expr * block    *)(* Boucle while *)
  
  (*and block = instr list  *)(* Un bloc est une séquence d'instructions *)
  
  (*instructions/expressions*)
  type inex = 
  | Expr of expr
  | Instr of instr
  
  type block = instr list  (* Un bloc est une liste de instructions ou expressions *)

  type prog = block list  (* Un programme est une liste de blocs *)

end

module IR = struct
  type ident = string
  type expr =
    | Int of int
    | Bool of bool
    | String of string
    | Var of ident
    | Call  of ident * expr list
    type instr =
    | Decl of ident (*pour declarer une variable*)
    | Assigne of ident * expr
    | Return of expr (* Retour d'une expression *)
    (*| If of expr * block * block *) (* Branchement conditionnel *)
    (*| While of expr * block    *)(* Boucle while *)
    
    (*and block = instr list  *)(* Un bloc est une séquence d'instructions *)
  (*type expr =*)
  (*| Int of int*)
  (*| Bool of bool*)
  (*| String of string*)
  (*| Call of string * expr list *)
  (*| Assigne of string * expr *)
  (*| If of expr * block * block conditionnelle *)
  (*| While of expr * blocké boucle while *)

  type stmt =
  | Expr of expr
  | Instr of instr
  
  type block = instr list  (* Un bloc est une liste de instructions ou expressions *)

  type prog = block list  (* Un programme est une liste de blocs *)

  let string_of_ir ast =
    let rec p_e = function
      | Bool b -> "Bool " ^ (string_of_bool b)
      | Int n  -> "Int " ^ (string_of_int n)
      | String s -> "String \"" ^ s ^ "\""
      | Var v  -> "Var \"" ^ v ^ "\""
      | Call (f, a) -> "Call (\"" ^ f ^ "\", [ "
      ^ (String.concat " ; " (List.map p_e a))
      ^ " ])"
    and p_i = function
      | Decl v        -> "Decl \"" ^ v ^ "\""
      | Assigne (v, e) -> "Assigne (\"" ^ v ^ "\", " ^ (p_e e) ^ ")"
      | Return e      -> "Return (" ^ (p_e e) ^ ")"
    and p_b b = "[ " ^ (String.concat " ; " (List.map p_i b)) ^ " ]"
    in p_b ast

end
