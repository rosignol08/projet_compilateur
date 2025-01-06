%{
  open Ast
  open Ast.Syntax
%}

%token Lend
%token <int> Lint
%token <string> Lstring Lvariable STRING
%token <bool> Ltrue Lfalse
%token <Ast.base_t> Ltypes
%token Lnot
%token Lplus
%token Lfin
%token Lassigne Lreturn Lprintf Lscanf 
%token Lobra Lfbra Lopar Lfpar
%token Lvirgule
%token Lif Lelse Lloop Leq Lneq Llt Lgt Lle Lge
%token Ladd Lsub Lmul Ldiv Lmod Land Lor Lxor
%token Ldef

%left Lplus

%start prog
%type <Ast.Syntax.prog> prog
%type <Ast.Syntax.def> def
%type <Ast.Syntax.block> block
%type <Ast.Syntax.instruction> instruction
%type <Ast.Syntax.expr> expr
%%

prog:
| code Lend { $1 }

code:
| def { [$1] }
| def code { $1::$2 }

(*| e = instruction ; p = prog { e :: p } *)
(*| Lend { [] } *)
(*; *)

def:
(*| Ldef ; typ = Ltypes; name = Lvariable; Lopar; args = arg_list; Lfpar; Lobra; block = block; Lfbra { Syntax.Func { typ = typ; name = name; args = args; block = block; pos = $startpos(name) }}*)
| Ldef ; typ = Ltypes ; name = Lvariable ; Lopar ; args = arg_list ; Lfpar ; Lobra ; block = block ; Lfbra {
    if name = "main" && (typ <> Int_t || args <> []) then
      raise (Failure "La fonction 'main' doit être de type 'int' et ne prendre aucun argument");
    Func { typ = typ; name = name; args = args; block = block; pos = $startpos(name) }
}


;

arg_list:
| Lvariable { [$1] }
| Lvariable; Lvirgule; args = arg_list { $1 :: args }
| { [] }
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
| v = Lvariable { Var { name = v; pos = $startpos(v) } }
| a = expr ; Lplus ; b = expr { Call { func = "_add" ; args = [ a ; b ] ; pos = $startpos($2) }}
| Lnot e = expr { Call { func = "_not"; args = [e]; pos = $startpos($1) } }
| expr ; Leq ; expr { Call { func = "_eq"; args = [$1; $3]; pos = $startpos($2) } }
| expr ; Lneq ; expr { Call { func = "_neq"; args = [$1; $3]; pos = $startpos($2) } }
| expr ; Llt ; expr { Call { func = "_lt"; args = [$1; $3]; pos = $startpos($2) } }
| expr ; Lgt ; expr { Call { func = "_gt"; args = [$1; $3]; pos = $startpos($2) } }
| expr ; Lle ; expr { Call { func = "_le"; args = [$1; $3]; pos = $startpos($2) } }
| expr ; Lge ; expr { Call { func = "_ge"; args = [$1; $3]; pos = $startpos($2) } }
| a = expr; Ladd; b = expr  { Call { func = "_add"; args = [ a ; b ];  pos = $startpos($2) } }
| a = expr; Lsub; b = expr  { Call { func = "_sub"; args = [ a ; b ];  pos = $startpos($2) } }
| a = expr; Lmul; b = expr  { Call { func = "_mul"; args = [ a ; b ];  pos = $startpos($2) } }
| a = expr; Ldiv; b = expr  { Call { func = "_div"; args = [ a ; b ];  pos = $startpos($2) } }
| a = expr; Lmod; b = expr  { Call { func = "_mod"; args = [ a ; b ];  pos = $startpos($2) } }
| a = expr; Land; b = expr  { Call { func = "_and"; args = [ a ; b ];  pos = $startpos($2) } }
| a = expr; Lor;  b = expr  { Call { func = "_or"; args =  [ a ; b ];  pos = $startpos($2) } }
| a = expr; Lxor; b = expr  { Call { func = "_xor"; args = [ a ; b ];  pos = $startpos($2) } }
;

instruction:
| d = Ltypes; v = Lvariable ; Lassigne ; e = expr ; Lfin { DeclAssigne { name = v; typ = d ; expr = e; pos = $startpos }}
| t = Ltypes ; v = Lvariable ; Lfin { Decl { name = v; typ = t; pos = $startpos } }
| v = Lvariable ; Lassigne ; e = expr ; Lfin { Assigne { name = v; expr = e; pos = $startpos } }
(*| r = Lreturn ; e = expr ; Lfin { Retourne { expr = e; pos = $startpos(r) } } *)
| Lprintf; Lopar; e = Lvariable; Lfpar; Lfin { Print { expr = Var { name = e; pos = $startpos(e) }; type_ = Int_t ; pos = $startpos(e) }}
| Lprintf; Lopar; e = expr; Lfpar; Lfin { Print { expr = e; type_ = Int_t ; pos = $startpos(e) }}
(* | Lscanf; Lopar; p = Lstring; Lvirgule; v = Lvariable; Lfpar; Lfin { Entree { expr = p; var = Var { name = v; pos = $startpos(v) }; pos = $startpos(p) }}  *)
(*| Lif; Lopar; e = expr; Lfpar; Lobra; tb = block; Lfbra; Lelse; Lobra; fb = block; Lfbra { Condition { compar = e; tblock = tb; fblock = fb; pos = $startpos($1) }}*)
| Lif; e = expr; Lobra; tb = block; Lfbra; Lelse; Lobra; fb = block; Lfbra { Condition { compar = e; tblock = tb; fblock = fb; pos = $startpos }}
| Lloop; Lopar; e = expr; Lfpar; Lobra; b = block; Lfbra { Boucle { expr = e; b = b; pos = $startpos }}
;