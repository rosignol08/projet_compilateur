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
| '"' ([^'"']*) '"' { Lstring (String.sub (Lexing.lexeme lexbuf) 1 ((String.length (Lexing.lexeme lexbuf)) - 2)) }
| '\n' { Lexing.new_line lexbuf ; token lexbuf }
| '+' { Lplus }
| num as n { Lint (int_of_string n) }
| "true" { Ltrue true }
| "false" { Lfalse false }
| '!' { Lnot}
| ';' { Lfin }
| ',' { Lvirgule }
| '(' { Lopar }
| ')' { Lfpar }
| '{' { Lobra }
| '}' { Lfbra }
| "==" { Leq }
| "!=" { Lneq }
| "<"  { Llt }
| ">"  { Lgt }
| "<=" { Lle }
| ">=" { Lge }
| "if" { Lif }
| "else" { Lelse }
| "int" { Ltypes(Int_t) }
| "string" { Ltypes(String_t) }
| "bool" { Ltypes(Bool_t) }
| "return" { Lreturn }
| "print" { Lprintf }
| "entree" { Lscanf }
| identifier as id { Lvariable id }
| '=' { Lassigne }
| _ as c { raise (Error c) }
