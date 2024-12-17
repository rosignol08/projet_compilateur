module Syntax = struct

  type expr =
  | Int of { value: int ; pos: Lexing.position }

  type prog = expr list

end

module IR = struct

  type expr =
  | Int of int

  type prog = expr list

end