type base_t =
  | Int_t
  | Func_t of base_t * base_t list

let string_of_t = function
  | Int_t -> "int"
  | Func_t (rt, ats) -> Printf.sprintf "%s -> %s" (String.concat ", " (List.map string_of_t ats)) (string_of_t rt)

module Syntax = struct
  type value =
  | Int of int
  | Call of {func : string ; args : expr list ; pos : Lexing.position}

  type expr =
  | Int of { value: int ; pos: Lexing.position }

  type prog = expr list

end

module IR = struct

  type expr =
  | Int of int

  type prog = expr list

end