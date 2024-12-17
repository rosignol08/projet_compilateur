%{
  open Ast.Syntax
%}

%token Lend
%token <int> Lint

%start prog

%type <Ast.Syntax.prog> prog

%%

prog:
| e = expr ; Lend { [ e ] }
| Lend { [] }
;

expr:
| n = Lint { Int { value = n ; pos = $startpos(n) } }
;