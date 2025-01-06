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

| '+' { print_endline "Found ' + '" ; Ladd }
| '-' { print_endline "Found ' - '" ; Lsub }
| '*' { print_endline "Found ' * '" ; Lmul }
| '/' { print_endline "Found ' / '" ; Ldiv }
| '%' { print_endline "Found ' % '" ; Lmod }
| "&&" { print_endline "Found ' && '" ; Land }
| "||" { print_endline "Found ' || '" ; Lor }
| '^' { print_endline "Found ' ^ '" ; Lxor }

| "==" { print_endline "Found '=='" ; Leq }
| "!=" { print_endline "Found '!='" ; Lneq }
| "<"  { print_endline "Found '<'" ; Llt }
| ">"  { print_endline "Found '>'" ; Lgt }
| "<=" { print_endline "Found '<='" ; Lle }
| ">=" { print_endline "Found '>='" ; Lge }
| "if" { print_endline "Found 'if'"; Lif }
| "else" { print_endline "Found 'else'"; Lelse }
| "while" { print_endline "Found 'while'"; Lloop }

| "int" { Ltypes(Int_t) }
| "string" { Ltypes(String_t) }
| "bool" { Ltypes(Bool_t) }
| "return" { Lreturn }
| "print" { print_endline "Found 'print'"; Lprintf }
| "entree" { Lscanf }

| "def" { print_endline "Found 'def'"; Ldef }

| identifier as id { Lvariable id }
| '=' { Lassigne }
| _ as c { raise (Error c) }
