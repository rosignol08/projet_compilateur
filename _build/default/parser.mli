
(* The type of tokens. *)

type token = 
  | Lvirgule
  | Lvariable of (string)
  | Ltypes of (Ast.base_t)
  | Ltrue of (bool)
  | Lstring of (string)
  | Lscanf
  | Lreturn
  | Lprintf
  | Lplus
  | Lopar
  | Lobra
  | Lnot
  | Lint of (int)
  | Lif
  | Lfpar
  | Lfin
  | Lfalse of (bool)
  | Lend
  | Lelse
  | Lcbra
  | Lassigne

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Syntax.prog)
