type base_t =
  | Int_t
  | String_t
  | Func_t of base_t * base_t list

let rec string_of_t = function
  | Int_t -> "int"
  | String_t -> "string"
  | Func_t (rt, ats) ->
    Printf.sprintf "(%s) -> %s"
      (String.concat ", " (List.map string_of_t ats))
      (string_of_t rt)

module Syntax = struct
  type expr =
  | Int of { value : int ; pos : Lexing.position }
  | String of { value : string ; pos : Lexing.position }
  | Call of { func : string ; args : expr list ; pos : Lexing.position }

  type prog = expr list

end

module IR = struct

  type expr =
  | Int of int
  | String of string
  | Call of string * expr list

  type prog = expr list

end
