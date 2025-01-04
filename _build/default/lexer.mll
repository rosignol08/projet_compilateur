{
  open Parser
  
  exception Error of char
}

let alpha = ['a'-'z' 'A'-'Z']
let num = ['0'-'9']+
let identifier = alpha (alpha | num | '-' | '_')*



rule token = parse
| eof { Lend }
| [' ' '\t']+ { token lexbuf }
| '\n' { Lexing.new_line lexbuf ; token lexbuf }
| '+' { Lplus }
| num as n { Lint (int_of_string n) }
| "true" { Ltrue true }
| "false" { Lfalse false }
| '!' { Lnot}
| _ as c { raise (Error c) }
| "int" { Lint_kw }
| "string" { Lstring_kw }
| "bool" { Lbool_kw }
| identifier as id { Lstring id }
