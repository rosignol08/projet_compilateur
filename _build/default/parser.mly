%token Lend
%token <int> Lint
%token <string> Lstring
%token <bool> Ltrue Lfalse
%token Lplus

%left Lplus

%start prog
%type <Ast.Syntax.prog> prog

%%

prog:
| e = expr ; p = prog { e :: p }
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
