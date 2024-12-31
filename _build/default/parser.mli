
(* The type of tokens. *)

type token = 
  | Lvirgule
  | Lvalue of (string)
  | Lstring_t
  | Lstring of (string)
  | Lreturn
  | Lplus
  | Lparo
  | Lparf
  | Lor
  | Lnot
  | Lint_t
  | Lint of (int)
  | Lgui
  | Lend
  | Lbool_t
  | Lbool of (bool)
  | Lassign
  | Land

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Syntax.prog)
