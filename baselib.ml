open Ast
module Env = Map.Make(String)
open Mpis
let types = 
  Env.of_list[
    "add", Func_t {args = [Int_t; Int_t]; ret = Int_t};
  ]

let stdlib = [
  Label "_add"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Add (V0, T0, T1)
  Jr Ra;
]