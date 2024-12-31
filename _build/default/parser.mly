%{
  open Ast.Syntax
%}

%token Lend
%token <int> Lint
%token <bool> Lbool
%token <string> Lstring
%token <string> Lvalue
%token Lassign
%token Lplus
%token Land Lor Lnot
%token Lreturn
%token Lint_t Lbool_t Lstring_t
%token Lparo Lparf Lvirgule Lgui

%left Lplus
%left Land Lor

%start prog
%type <Ast.Syntax.prog> prog
%type <Ast.Syntax.expr> expr
%type <Ast.Syntax.expr list> args
%type <Ast.Syntax.instr> instr
%type <Ast.Syntax.instr list> block

%%
(*prog:*)
(*  | e = instr ; Lend { [ e ] }*)
(*  | Lend { [] }*)
(*prog:*)
(*  | Lend { [] }*)
(*  | i = block ; p = prog { i :: p }*)
(*;*)
(**)
(*block:*)
(*  | Lend { [] }*)
(*  | i = instr ; b = block { i :: b }*)
(*;*)

prog:
  | b = block { [b] } (*TODO liste d'un seul block verifier*)
;

block:
  | Lend { [] }
  | i = instr ; Lend ; b = block { i :: b }

instr:
  | t = Lint_t ; v = Lvalue { Decl { var = v; base_t = Int_t; pos = $startpos(v) } }
  | t = Lbool_t ; v = Lvalue { Decl { var = v; base_t = Bool_t; pos = $startpos(v) } }
  | t = Lstring_t ; v = Lvalue { Decl { var = v; base_t = String_t; pos = $startpos(v) } }
  | v = Lvalue ; Lassign ; e = expr { Assigne { var = v; expr = e; pos = $startpos(v) } }
  | r = Lreturn ; e = expr { Return { expr = e; pos = $startpos(e) } }
;

expr:
  | n = Lint { Int { value = n; pos = $startpos(n) } }
  | b = Lbool { Bool { value = b; pos = $startpos(b) } }
  | s = Lstring { String { value = s; pos = $startpos(s) } }
  | v = Lvalue { Var { name = v; pos = $startpos(v) } }
  | f = Lvalue ; Lparo ; args = args ; Lparf { Call { func = f; args = args; pos = $startpos(f) } }
  | e1 = expr ; Lplus ; e2 = expr { Call { func = "_add"; args = [e1; e2]; pos = $startpos(e1) } }
  | e1 = expr ; Land ; e2 = expr { Call { func = "_and"; args = [e1; e2]; pos = $startpos(e1) } }
  | e1 = expr ; Lor ; e2 = expr { Call { func = "_or"; args = [e1; e2]; pos = $startpos(e1) } }
  | Lnot ; e = expr { Call { func = "_not"; args = [e]; pos = $startpos(e) } }
;

args:
  | e = expr { [e] }
  | e = expr ; Lvirgule ; es = args { e :: es }
;
