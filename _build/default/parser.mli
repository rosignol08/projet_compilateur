
(* The type of tokens. *)

type token = 
  | STRING of (string)
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
  | Lneq
  | Llt
  | Lle
  | Lint of (int)
  | Lif
  | Lgt
  | Lge
  | Lfpar
  | Lfin
  | Lfbra
  | Lfalse of (bool)
  | Leq
  | Lend
  | Lelse
  | Lassigne

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Syntax.prog)
