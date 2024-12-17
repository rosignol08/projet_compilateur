%{
  open Ast.Syntax
%}

%token Lend
%token <int> Lint
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
| a = expr ; Lplus ; b = expr { Call { func = "_add" ; args = [a ; b] ; pos = $startpos($2) } }
;