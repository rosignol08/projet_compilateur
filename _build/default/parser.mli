
(* The type of tokens. *)

type token = 
  | Ltrue of (bool)
  | Lstring of (string)
  | Lplus
  | Lint of (int)
  | Lfalse of (bool)
  | Lend

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Syntax.prog)
