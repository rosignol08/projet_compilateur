%token Lend
%token <int> Lint
%token <string> Lstring
%token <bool> Ltrue Lfalse
%token Lnot
%token Lplus
%token Lint_kw Lstring_kw Lbool_kw

%left Lplus

%start prog
%type <Ast.Syntax.prog> prog

%%

prog:
| e = expr ; p = prog { e :: p }
| Lend { [] }
;

type_kw:
| Lint_kw { "int" }
| Lstring_kw { "string" }
| Lbool_kw { "bool" }


expr:
| n = Lint { Int { value = n ; pos = $startpos(n) } }
| s = Lstring { String { value = s; pos = $startpos(s) } }
| b = Ltrue { Bool { value = b; pos = $startpos(b) } }
| b = Lfalse { Bool { value = b; pos = $startpos(b) } }
| t = type_kw ; v = Lstring {
  Decl { name = v; typ = t; pos = $startpos(v) }
}
| a = expr ; Lplus ; b = expr {
  Call { func = "_add" ; args = [ a ; b ] ; pos = $startpos($2) }
}
| Lnot e = expr { Call { func = "_not"; args = [e]; pos = $startpos($1) } }
