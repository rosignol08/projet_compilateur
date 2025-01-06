
(* The type of tokens. *)

type token = 
  | STRING of (string)
  | Lxor
  | Lvirgule
  | Lvariable of (string)
  | Ltypes of (Ast.base_t)
  | Ltrue of (bool)
  | Lsub
  | Lstring of (string)
  | Lscanf
  | Lreturn
  | Lprintf
  | Lplus
  | Lor
  | Lopar
  | Lobra
  | Lnot
  | Lneq
  | Lmul
  | Lmod
  | Llt
  | Lloop
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
  | Ldiv
  | Ldef
  | Lassigne
  | Land
  | Ladd

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Syntax.prog)
