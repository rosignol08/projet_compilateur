{
  open Lexing
  open Parser

  exception Error of char
}

let num = ['0' - '9']

rule token = parse
| eof { Lend }
| '\n' { Lexing.new_line lexbuf ; token lexbuf }
| num+ as n { Lint (int_of_string n) }
| _ as c { raise (Error c) }
| [' ''\t']+{token lexbuf}
| num as {Lint }
