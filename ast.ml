type base_t =
  | Int_t
  | String_t
  | Bool_t
  | Func_t of base_t * base_t list

let rec string_of_t = function
  | Int_t -> "int"
  | String_t -> "string"
  | Bool_t -> "bool"
  | Func_t (rt, ats) ->
    Printf.sprintf "(%s) -> %s"
      (String.concat ", " (List.map string_of_t ats))
      (string_of_t rt)

module Syntax = struct
  type expr =
  | Int of { value : int ; pos : Lexing.position }
  | String of { value : string ; pos : Lexing.position }
  | Bool of { value : bool ; pos : Lexing.position }
  | Var of { name : string ; pos : Lexing.position }
  | Call of { func : string ; args : expr list ; pos : Lexing.position }
  
  type instruction =
  | Decl of { name : string ; typ : base_t ; pos : Lexing.position }
  | Assigne of { name : string ; expr : expr ; pos : Lexing.position }
  | DeclAssigne of { name : string ; typ : base_t ; expr : expr ; pos : Lexing.position }
  (*| Retourne of { expr : expr ; pos : Lexing.position } *)
  | Print of { expr: expr; type_ : base_t ; pos: Lexing.position }
  | Entree of { expr: expr; type_ : base_t ; pos: Lexing.position }
  | Condition of { compar: expr; tblock: block; fblock: block; pos: Lexing.position }
  | Boucle of { expr: expr; b: block; pos: Lexing.position }

  and block = instruction list
  
  type def =
  | Func of { typ : base_t; name : string; args : string list; block : block; pos : Lexing.position }
  
  type prog = def list

end

module IR = struct

  type expr =
  | Int of int
  | String of string
  | Bool of bool
  | Var of string
  | Call of string * expr list
  
  type instruction = 
  | Decl of string
  | Assigne of string * expr
  | DeclAssigne of string * expr
  (*| Retourne of expr *)
  | Print of expr * base_t
  | Condition of expr * block * block
  | Boucle of expr * block
  | Entree of expr * base_t
  
  and block = instruction list
  
  type def =
  | Func of base_t * string * string list * block
  type prog = def list

end
