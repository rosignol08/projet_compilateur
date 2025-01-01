{
  open Parser
  
  exception Error of char
}

let num = ['0' - '9']
let lettres = ['a'-'z' 'A'-'Z']
let identifiant = lettres(lettres | num | '-' | '_')*

rule token = parse
| eof { Lend }
| [' ' '\t']+ { token lexbuf }
| '\n' { Lexing.new_line lexbuf ; token lexbuf }
| '+' { Lplus }
| num+ as n { Lint (int_of_string n) }
| _ as c { raise (Error c) }
| '#'             { comment lexbuf }
| "true"  { Lbool true }
| "false" { Lbool false }
| "and"   { Land }
| "or"    { Lor }
| "not"   { Lnot }
| '"'[^'"']*'"' as lxm { Lstring (String.sub lxm 1 (String.length lxm - 2)) }
| "=" { Lassign }
| "int" { Lint_t }
| "bool" { Lbool_t }
| "string" { Lstring_t }
| "(" { Lparo }
| ")" { Lparf }
| "," { Lvirgule }
| identifiant as id { Lvalue id }

and comment = parse
| eof { Lend }
| '\n' { Lexing.new_line lexbuf ; token lexbuf }
| _ { comment lexbuf }