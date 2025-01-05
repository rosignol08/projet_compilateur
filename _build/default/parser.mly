%{
open Ast
%}

%token Lend
%token <int> Lint
%token <string> Lstring Lvariable
%token <bool> Ltrue Lfalse
%token <Ast.base_t> Ltypes
%token Lnot
%token Lplus
%token Lfin
%token Lassigne

%left Lplus

%start prog
%type <Ast.Syntax.prog> prog
%%

prog:
| e = instr ; p = prog { e :: p }
| Lend { [] }
;

expr:
| n = Lint { Int { value = n ; pos = $startpos(n) } }
| s = Lstring { String { value = s; pos = $startpos(s) } }
| b = Ltrue { Bool { value = b; pos = $startpos(b) } }
| b = Lfalse { Bool { value = b; pos = $startpos(b) } }
| a = expr ; Lplus ; b = expr {
  Call { func = "_add" ; args = [ a ; b ] ; pos = $startpos($2) }
}
| Lnot e = expr { Call { func = "_not"; args = [e]; pos = $startpos($1) } }

instr:
| t = Ltypes ; v = Lvariable ; Lfin { Decl { name = v; typ = t; pos = $startpos } }
| v = Lvariable ; Lassigne ; e = expr ; Lfin { Assigne { name = v; expr = e; pos = $startpos } }