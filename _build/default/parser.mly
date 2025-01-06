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
%token Lassigne Lreturn Lprintf Lscanf 
%token Lobra Lfbra Lopar Lfpar
%token Lvirgule
%token Lif Lelse Leq Lneq Llt Lgt Lle Lge

%left Lplus

%start prog
%type <Ast.Syntax.prog> prog
%%

prog:
| e = instruction ; p = prog { e :: p }
| Lend { [] }
;

block:
| instruction        { [$1] }
| instruction block { $1::$2 }
| Lend         { [] }
;

expr:
| n = Lint { Int { value = n ; pos = $startpos(n) } }
| s = Lstring { String { value = s; pos = $startpos(s) } }
| b = Ltrue { Bool { value = b; pos = $startpos(b) } }
| b = Lfalse { Bool { value = b; pos = $startpos(b) } }
| a = expr ; Lplus ; b = expr { Call { func = "_add" ; args = [ a ; b ] ; pos = $startpos($2) }}
| Lnot e = expr { Call { func = "_not"; args = [e]; pos = $startpos($1) } }
| expr Leq expr { Call { func = "%eq"; args = [$1; $3]; pos = $startpos($2) } }
| expr Lneq expr { Call { func = "%neq"; args = [$1; $3]; pos = $startpos($2) } }
| expr Llt expr { Call { func = "%lt"; args = [$1; $3]; pos = $startpos($2) } }
| expr Lgt expr { Call { func = "%gt"; args = [$1; $3]; pos = $startpos($2) } }
| expr Lle expr { Call { func = "%le"; args = [$1; $3]; pos = $startpos($2) } }
| expr Lge expr { Call { func = "%ge"; args = [$1; $3]; pos = $startpos($2) } }

instruction:
| d = Ltypes; v = Lvariable ; Lassigne ; e = expr ; Lfin { DeclAssigne { name = v; typ = d ; expr = e; pos = $startpos }}
| t = Ltypes ; v = Lvariable ; Lfin { Decl { name = v; typ = t; pos = $startpos } }
| v = Lvariable ; Lassigne ; e = expr ; Lfin { Assigne { name = v; expr = e; pos = $startpos } }
(*| r = Lreturn ; e = expr ; Lfin { Retourne { expr = e; pos = $startpos(r) } } *)
| Lprintf; Lopar; e = Lvariable; Lfpar; Lfin { Print { expr = Var { name = e; pos = $startpos(e) }; type_ = Int_t ; pos = $startpos(e) }}
| Lprintf; Lopar; e = expr; Lfpar; Lfin { Print { expr = e; type_ = Int_t ; pos = $startpos(e) }}
(*| Lscanf; Lopar; p = Lstring; Lvirgule; v = Lvariable; Lfpar; Lfin { Entree { prompt = p; var = Var { name = v; pos = $startpos(v) }; pos = $startpos(p) }} *)
| Lif; Lopar; e = expr; Lfpar; Lobra; tb = block; Lfbra; Lelse; Lobra; fb = block; Lfbra { Condition { compar = e; tblock = tb; fblock = fb; pos = $startpos($1) }}
