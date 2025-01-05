
(* The type of tokens. *)

type token = 
  | Lvariable of (string)
  | Ltypes of (Ast.base_t)
  | Ltrue of (bool)
  | Lstring of (string)
  | Lplus
  | Lnot
  | Lint of (int)
  | Lfin
  | Lfalse of (bool)
  | Lend
  | Lassigne

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Syntax.prog)
