open Ast
open Mips

module Env = Map.Make(String)

let types =
  Env.of_seq (List.to_seq [
    "_add", Func_t (Int_t, [ Int_t ; Int_t ]);
    "_not", Func_t (Bool_t, [ Bool_t ]);
    "_lt", Func_t (Bool_t, [ Int_t ; Int_t ]);
    "_gt", Func_t (Bool_t, [ Int_t ; Int_t ]);
    "_eq", Func_t (Bool_t, [ Int_t ; Int_t ]);
    "_neq", Func_t (Bool_t, [ Int_t ; Int_t ]);
    "_le", Func_t (Bool_t, [ Int_t ; Int_t ]);
    "_ge", Func_t (Bool_t, [ Int_t ; Int_t ]);
  ])

let stdlib =
  [ Label "_add"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Add (V0, T0, T1)
  ; Jr RA

  (* Less than (%lt) *)
  ; Label "_lt"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Slt (V0, T0, T1)
  ; Jr RA

  (* Greater than (%gt) *)
  ; Label "_gt"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Sgt (V0, T0, T1)
  ; Jr RA

  (* Equality (%eq) *)
  ; Label "_eq"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Seq (V0, T0, T1)
  ; Jr RA

  (* Not equal (%neq) *)
  ; Label "_neq"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Sne (V0, T0, T1)
  ; Jr RA

  (* Less than or equal (%le) *)
  ; Label "_le"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Sle (V0, T0, T1)
  ; Jr RA

  (* Greater than or equal (%ge) *)
  ; Label "_ge"
  ; Lw (T0, Mem (SP, 4))
  ; Lw (T1, Mem (SP, 0))
  ; Sge (V0, T0, T1)
  ; Jr RA
  ]

(*let types =*)
(*  Env.of_seq (List.to_seq [*)
(*    "_add", Func_t (Int_t, [ Int_t ; Int_t ]);*)
(*    "_and", Func_t (Bool_t, [Bool_t; Bool_t]);*)
(*    "_or",  Func_t (Bool_t, [Bool_t; Bool_t]);*)
(*    "_not", Func_t (Bool_t, [Bool_t]);*)
(*    "_assign_string", Func_t (String_t, [String_t]);*)
(*    "_print_string", Func_t (Int_t, [String_t]);*)
(*    ])*)
(**)
(*let stdlib =*)
(*  [ Label "_add"*)
(*  ; Lw (T0, Mem (SP, 4))*)
(*  ; Lw (T1, Mem (SP, 0))*)
(*  ; Add (V0, T0, T1)*)
(*  ; Jr RA*)
(**)
(*  ;Label "_and"*)
(*  ;Lw (T0, Mem (SP, 4))*)
(*  ;Lw (T1, Mem (SP, 0))*)
(*  ;And (V0, T0, T1)*)
(*  ;Jr RA*)
(**)
(*  ;Label "_or"*)
(*  ;Lw (T0, Mem (SP, 4))*)
(*  ;Lw (T1, Mem (SP, 0))*)
(*  ;Or (V0, T0, T1)*)
(*  ;Jr RA*)
(**)
(*  ;Label "_not"*)
(*  ;Lw (A0, Mem (SP, 0))*)
(*  ;Not (V0, T0)*)
(*  ;Jr RA*)
(**)
(*  ;Label "_assign_string"*)
(*  ;Lw (T0, Mem (SP, 0))*)
(*  ;Sw (T0, Mem (SP, 4))*)
(*  ;Jr RA*)
(**)
(*  ;Label "_print_string"*)
(*  ;Lw (A0, Mem (SP, 0))*)
(*  ;Li (V0, 4)*)
(*  ;Syscall*)
(*  ;Jr RA*)
(*  *)
(*]*)
(**)
(**)
(**)