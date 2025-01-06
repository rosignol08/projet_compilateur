
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | STRING of (
# 8 "parser.mly"
       (string)
# 15 "parser.ml"
  )
    | Lxor
    | Lvirgule
    | Lvariable of (
# 8 "parser.mly"
       (string)
# 22 "parser.ml"
  )
    | Ltypes of (
# 10 "parser.mly"
       (Ast.base_t)
# 27 "parser.ml"
  )
    | Ltrue of (
# 9 "parser.mly"
       (bool)
# 32 "parser.ml"
  )
    | Lsub
    | Lstring of (
# 8 "parser.mly"
       (string)
# 38 "parser.ml"
  )
    | Lscanf
    | Lreturn
    | Lprintf
    | Lplus
    | Lor
    | Lopar
    | Lobra
    | Lnot
    | Lneq
    | Lmul
    | Lmod
    | Llt
    | Lloop
    | Lle
    | Lint of (
# 7 "parser.mly"
       (int)
# 57 "parser.ml"
  )
    | Lif
    | Lgt
    | Lge
    | Lfpar
    | Lfin
    | Lfbra
    | Lfalse of (
# 9 "parser.mly"
       (bool)
# 68 "parser.ml"
  )
    | Leq
    | Lend
    | Lelse
    | Ldiv
    | Ldef
    | Lassigne
    | Land
    | Ladd
  
end

include MenhirBasics

# 1 "parser.mly"
  
  open Ast
  open Ast.Syntax

# 88 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState04 : (('s, _menhir_box_prog) _menhir_cell1_Ldef _menhir_cell0_Ltypes _menhir_cell0_Lvariable, _menhir_box_prog) _menhir_state
    (** State 04.
        Stack shape : Ldef Ltypes Lvariable.
        Start symbol: prog. *)

  | MenhirState06 : (('s, _menhir_box_prog) _menhir_cell1_Lvariable, _menhir_box_prog) _menhir_state
    (** State 06.
        Stack shape : Lvariable.
        Start symbol: prog. *)

  | MenhirState10 : ((('s, _menhir_box_prog) _menhir_cell1_Ldef _menhir_cell0_Ltypes _menhir_cell0_Lvariable, _menhir_box_prog) _menhir_cell1_arg_list, _menhir_box_prog) _menhir_state
    (** State 10.
        Stack shape : Ldef Ltypes Lvariable arg_list.
        Start symbol: prog. *)

  | MenhirState12 : (('s, _menhir_box_prog) _menhir_cell1_Lvariable, _menhir_box_prog) _menhir_state
    (** State 12.
        Stack shape : Lvariable.
        Start symbol: prog. *)

  | MenhirState16 : (('s, _menhir_box_prog) _menhir_cell1_Lnot, _menhir_box_prog) _menhir_state
    (** State 16.
        Stack shape : Lnot.
        Start symbol: prog. *)

  | MenhirState20 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lxor, _menhir_box_prog) _menhir_state
    (** State 20.
        Stack shape : expr Lxor.
        Start symbol: prog. *)

  | MenhirState22 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lsub, _menhir_box_prog) _menhir_state
    (** State 22.
        Stack shape : expr Lsub.
        Start symbol: prog. *)

  | MenhirState24 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lplus, _menhir_box_prog) _menhir_state
    (** State 24.
        Stack shape : expr Lplus.
        Start symbol: prog. *)

  | MenhirState26 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lor, _menhir_box_prog) _menhir_state
    (** State 26.
        Stack shape : expr Lor.
        Start symbol: prog. *)

  | MenhirState28 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lneq, _menhir_box_prog) _menhir_state
    (** State 28.
        Stack shape : expr Lneq.
        Start symbol: prog. *)

  | MenhirState30 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lmul, _menhir_box_prog) _menhir_state
    (** State 30.
        Stack shape : expr Lmul.
        Start symbol: prog. *)

  | MenhirState32 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lmod, _menhir_box_prog) _menhir_state
    (** State 32.
        Stack shape : expr Lmod.
        Start symbol: prog. *)

  | MenhirState34 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Llt, _menhir_box_prog) _menhir_state
    (** State 34.
        Stack shape : expr Llt.
        Start symbol: prog. *)

  | MenhirState36 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lle, _menhir_box_prog) _menhir_state
    (** State 36.
        Stack shape : expr Lle.
        Start symbol: prog. *)

  | MenhirState38 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lgt, _menhir_box_prog) _menhir_state
    (** State 38.
        Stack shape : expr Lgt.
        Start symbol: prog. *)

  | MenhirState40 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lge, _menhir_box_prog) _menhir_state
    (** State 40.
        Stack shape : expr Lge.
        Start symbol: prog. *)

  | MenhirState42 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Leq, _menhir_box_prog) _menhir_state
    (** State 42.
        Stack shape : expr Leq.
        Start symbol: prog. *)

  | MenhirState44 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Ldiv, _menhir_box_prog) _menhir_state
    (** State 44.
        Stack shape : expr Ldiv.
        Start symbol: prog. *)

  | MenhirState46 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Land, _menhir_box_prog) _menhir_state
    (** State 46.
        Stack shape : expr Land.
        Start symbol: prog. *)

  | MenhirState48 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Ladd, _menhir_box_prog) _menhir_state
    (** State 48.
        Stack shape : expr Ladd.
        Start symbol: prog. *)

  | MenhirState55 : (('s, _menhir_box_prog) _menhir_cell1_Ltypes _menhir_cell0_Lvariable, _menhir_box_prog) _menhir_state
    (** State 55.
        Stack shape : Ltypes Lvariable.
        Start symbol: prog. *)

  | MenhirState59 : (('s, _menhir_box_prog) _menhir_cell1_Lprintf, _menhir_box_prog) _menhir_state
    (** State 59.
        Stack shape : Lprintf.
        Start symbol: prog. *)

  | MenhirState67 : (('s, _menhir_box_prog) _menhir_cell1_Lloop, _menhir_box_prog) _menhir_state
    (** State 67.
        Stack shape : Lloop.
        Start symbol: prog. *)

  | MenhirState70 : ((('s, _menhir_box_prog) _menhir_cell1_Lloop, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 70.
        Stack shape : Lloop expr.
        Start symbol: prog. *)

  | MenhirState71 : (('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_state
    (** State 71.
        Stack shape : Lif.
        Start symbol: prog. *)

  | MenhirState73 : ((('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 73.
        Stack shape : Lif expr.
        Start symbol: prog. *)

  | MenhirState75 : (('s, _menhir_box_prog) _menhir_cell1_instruction, _menhir_box_prog) _menhir_state
    (** State 75.
        Stack shape : instruction.
        Start symbol: prog. *)

  | MenhirState80 : (((('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_block, _menhir_box_prog) _menhir_state
    (** State 80.
        Stack shape : Lif expr block.
        Start symbol: prog. *)

  | MenhirState88 : (('s, _menhir_box_prog) _menhir_cell1_def, _menhir_box_prog) _menhir_state
    (** State 88.
        Stack shape : def.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_arg_list = 
  | MenhirCell1_arg_list of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_block = 
  | MenhirCell1_block of 's * ('s, 'r) _menhir_state * (Ast.Syntax.block)

and ('s, 'r) _menhir_cell1_def = 
  | MenhirCell1_def of 's * ('s, 'r) _menhir_state * (Ast.Syntax.def)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.Syntax.expr) * Lexing.position

and ('s, 'r) _menhir_cell1_instruction = 
  | MenhirCell1_instruction of 's * ('s, 'r) _menhir_state * (Ast.Syntax.instruction)

and 's _menhir_cell0_Ladd = 
  | MenhirCell0_Ladd of 's * Lexing.position

and 's _menhir_cell0_Land = 
  | MenhirCell0_Land of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Ldef = 
  | MenhirCell1_Ldef of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_Ldiv = 
  | MenhirCell0_Ldiv of 's * Lexing.position

and 's _menhir_cell0_Leq = 
  | MenhirCell0_Leq of 's * Lexing.position

and 's _menhir_cell0_Lge = 
  | MenhirCell0_Lge of 's * Lexing.position

and 's _menhir_cell0_Lgt = 
  | MenhirCell0_Lgt of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Lif = 
  | MenhirCell1_Lif of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_Lle = 
  | MenhirCell0_Lle of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Lloop = 
  | MenhirCell1_Lloop of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_Llt = 
  | MenhirCell0_Llt of 's * Lexing.position

and 's _menhir_cell0_Lmod = 
  | MenhirCell0_Lmod of 's * Lexing.position

and 's _menhir_cell0_Lmul = 
  | MenhirCell0_Lmul of 's * Lexing.position

and 's _menhir_cell0_Lneq = 
  | MenhirCell0_Lneq of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Lnot = 
  | MenhirCell1_Lnot of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_Lor = 
  | MenhirCell0_Lor of 's * Lexing.position

and 's _menhir_cell0_Lplus = 
  | MenhirCell0_Lplus of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Lprintf = 
  | MenhirCell1_Lprintf of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_Lsub = 
  | MenhirCell0_Lsub of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Ltypes = 
  | MenhirCell1_Ltypes of 's * ('s, 'r) _menhir_state * (
# 10 "parser.mly"
       (Ast.base_t)
# 318 "parser.ml"
) * Lexing.position

and 's _menhir_cell0_Ltypes = 
  | MenhirCell0_Ltypes of 's * (
# 10 "parser.mly"
       (Ast.base_t)
# 325 "parser.ml"
) * Lexing.position

and ('s, 'r) _menhir_cell1_Lvariable = 
  | MenhirCell1_Lvariable of 's * ('s, 'r) _menhir_state * (
# 8 "parser.mly"
       (string)
# 332 "parser.ml"
) * Lexing.position

and 's _menhir_cell0_Lvariable = 
  | MenhirCell0_Lvariable of 's * (
# 8 "parser.mly"
       (string)
# 339 "parser.ml"
) * Lexing.position

and 's _menhir_cell0_Lxor = 
  | MenhirCell0_Lxor of 's * Lexing.position

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.Syntax.prog) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 54 "parser.mly"
            ( [_1] )
# 353 "parser.ml"
     : (string list))

let _menhir_action_02 =
  fun _1 args ->
    (
# 55 "parser.mly"
                                       ( _1 :: args )
# 361 "parser.ml"
     : (string list))

let _menhir_action_03 =
  fun () ->
    (
# 56 "parser.mly"
  ( [] )
# 369 "parser.ml"
     : (string list))

let _menhir_action_04 =
  fun _1 ->
    (
# 60 "parser.mly"
                     ( [_1] )
# 377 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_05 =
  fun _1 _2 ->
    (
# 61 "parser.mly"
                    ( _1::_2 )
# 385 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_06 =
  fun () ->
    (
# 62 "parser.mly"
               ( [] )
# 393 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_07 =
  fun _1 ->
    (
# 35 "parser.mly"
      ( [_1] )
# 401 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_action_08 =
  fun _1 _2 ->
    (
# 36 "parser.mly"
           ( _1::_2 )
# 409 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_action_09 =
  fun _startpos_name_ args block name typ ->
    (
# 44 "parser.mly"
                                                                                                           (
    if name = "main" && (typ <> Int_t || args <> []) then
      raise (Failure "La fonction 'main' doit être de type 'int' et ne prendre aucun argument");
    Func { typ = typ; name = name; args = args; block = block; pos = _startpos_name_ }
)
# 421 "parser.ml"
     : (Ast.Syntax.def))

let _menhir_action_10 =
  fun _startpos_n_ n ->
    (
# 66 "parser.mly"
           ( Int { value = n ; pos = _startpos_n_ } )
# 429 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_11 =
  fun _startpos_s_ s ->
    (
# 67 "parser.mly"
              ( String { value = s; pos = _startpos_s_ } )
# 437 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_12 =
  fun _startpos_b_ b ->
    (
# 68 "parser.mly"
            ( Bool { value = b; pos = _startpos_b_ } )
# 445 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_13 =
  fun _startpos_b_ b ->
    (
# 69 "parser.mly"
             ( Bool { value = b; pos = _startpos_b_ } )
# 453 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_14 =
  fun _startpos_v_ v ->
    (
# 70 "parser.mly"
                ( Var { name = v; pos = _startpos_v_ } )
# 461 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_15 =
  fun _startpos__2_ a b ->
    (
# 71 "parser.mly"
                              ( Call { func = "_add" ; args = [ a ; b ] ; pos = _startpos__2_ })
# 469 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_16 =
  fun _startpos__1_ e ->
    (
# 72 "parser.mly"
                ( Call { func = "_not"; args = [e]; pos = _startpos__1_ } )
# 477 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_17 =
  fun _1 _3 _startpos__2_ ->
    (
# 73 "parser.mly"
                    ( Call { func = "_eq"; args = [_1; _3]; pos = _startpos__2_ } )
# 485 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_18 =
  fun _1 _3 _startpos__2_ ->
    (
# 74 "parser.mly"
                     ( Call { func = "_neq"; args = [_1; _3]; pos = _startpos__2_ } )
# 493 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_19 =
  fun _1 _3 _startpos__2_ ->
    (
# 75 "parser.mly"
                    ( Call { func = "_lt"; args = [_1; _3]; pos = _startpos__2_ } )
# 501 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_20 =
  fun _1 _3 _startpos__2_ ->
    (
# 76 "parser.mly"
                    ( Call { func = "_gt"; args = [_1; _3]; pos = _startpos__2_ } )
# 509 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_21 =
  fun _1 _3 _startpos__2_ ->
    (
# 77 "parser.mly"
                    ( Call { func = "_le"; args = [_1; _3]; pos = _startpos__2_ } )
# 517 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_22 =
  fun _1 _3 _startpos__2_ ->
    (
# 78 "parser.mly"
                    ( Call { func = "_ge"; args = [_1; _3]; pos = _startpos__2_ } )
# 525 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_23 =
  fun _startpos__2_ a b ->
    (
# 79 "parser.mly"
                            ( Call { func = "_add"; args = [ a ; b ];  pos = _startpos__2_ } )
# 533 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_24 =
  fun _startpos__2_ a b ->
    (
# 80 "parser.mly"
                            ( Call { func = "_sub"; args = [ a ; b ];  pos = _startpos__2_ } )
# 541 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_25 =
  fun _startpos__2_ a b ->
    (
# 81 "parser.mly"
                            ( Call { func = "_mul"; args = [ a ; b ];  pos = _startpos__2_ } )
# 549 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_26 =
  fun _startpos__2_ a b ->
    (
# 82 "parser.mly"
                            ( Call { func = "_div"; args = [ a ; b ];  pos = _startpos__2_ } )
# 557 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_27 =
  fun _startpos__2_ a b ->
    (
# 83 "parser.mly"
                            ( Call { func = "_mod"; args = [ a ; b ];  pos = _startpos__2_ } )
# 565 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_28 =
  fun _startpos__2_ a b ->
    (
# 84 "parser.mly"
                            ( Call { func = "_and"; args = [ a ; b ];  pos = _startpos__2_ } )
# 573 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_29 =
  fun _startpos__2_ a b ->
    (
# 85 "parser.mly"
                            ( Call { func = "_or"; args =  [ a ; b ];  pos = _startpos__2_ } )
# 581 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_30 =
  fun _startpos__2_ a b ->
    (
# 86 "parser.mly"
                            ( Call { func = "_xor"; args = [ a ; b ];  pos = _startpos__2_ } )
# 589 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_31 =
  fun _startpos_d_ d e v ->
    let _startpos = _startpos_d_ in
    (
# 90 "parser.mly"
                                                         ( DeclAssigne { name = v; typ = d ; expr = e; pos = _startpos })
# 598 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_32 =
  fun _startpos_t_ t v ->
    let _startpos = _startpos_t_ in
    (
# 91 "parser.mly"
                                    ( Decl { name = v; typ = t; pos = _startpos } )
# 607 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_33 =
  fun _startpos_v_ e v ->
    let _startpos = _startpos_v_ in
    (
# 92 "parser.mly"
                                             ( Assigne { name = v; expr = e; pos = _startpos } )
# 616 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_34 =
  fun _startpos_e_ e ->
    (
# 94 "parser.mly"
                                             ( Print { expr = Var { name = e; pos = _startpos_e_ }; type_ = Int_t ; pos = _startpos_e_ })
# 624 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_35 =
  fun _startpos_e_ e ->
    (
# 95 "parser.mly"
                                        ( Print { expr = e; type_ = Int_t ; pos = _startpos_e_ })
# 632 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_36 =
  fun _startpos__1_ e fb tb ->
    let _startpos = _startpos__1_ in
    (
# 98 "parser.mly"
                                                                           ( Condition { compar = e; tblock = tb; fblock = fb; pos = _startpos })
# 641 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_37 =
  fun _startpos__1_ b e ->
    let _startpos = _startpos__1_ in
    (
# 99 "parser.mly"
                                                         ( Boucle { expr = e; b = b; pos = _startpos })
# 650 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_38 =
  fun _1 ->
    (
# 32 "parser.mly"
            ( _1 )
# 658 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Ladd ->
        "Ladd"
    | Land ->
        "Land"
    | Lassigne ->
        "Lassigne"
    | Ldef ->
        "Ldef"
    | Ldiv ->
        "Ldiv"
    | Lelse ->
        "Lelse"
    | Lend ->
        "Lend"
    | Leq ->
        "Leq"
    | Lfalse _ ->
        "Lfalse"
    | Lfbra ->
        "Lfbra"
    | Lfin ->
        "Lfin"
    | Lfpar ->
        "Lfpar"
    | Lge ->
        "Lge"
    | Lgt ->
        "Lgt"
    | Lif ->
        "Lif"
    | Lint _ ->
        "Lint"
    | Lle ->
        "Lle"
    | Lloop ->
        "Lloop"
    | Llt ->
        "Llt"
    | Lmod ->
        "Lmod"
    | Lmul ->
        "Lmul"
    | Lneq ->
        "Lneq"
    | Lnot ->
        "Lnot"
    | Lobra ->
        "Lobra"
    | Lopar ->
        "Lopar"
    | Lor ->
        "Lor"
    | Lplus ->
        "Lplus"
    | Lprintf ->
        "Lprintf"
    | Lreturn ->
        "Lreturn"
    | Lscanf ->
        "Lscanf"
    | Lstring _ ->
        "Lstring"
    | Lsub ->
        "Lsub"
    | Ltrue _ ->
        "Ltrue"
    | Ltypes _ ->
        "Ltypes"
    | Lvariable _ ->
        "Lvariable"
    | Lvirgule ->
        "Lvirgule"
    | Lxor ->
        "Lxor"
    | STRING _ ->
        "STRING"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_90 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let _1 = _v in
      let _v = _menhir_action_38 _1 in
      MenhirBox_prog _v
  
  let rec _menhir_goto_code : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_90 _menhir_stack _v
      | MenhirState88 ->
          _menhir_run_89 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_89 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_def -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_def (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_08 _1 _2 in
      _menhir_goto_code _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Ldef (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltypes _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_Ltypes (_menhir_stack, _v, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lvariable _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_Lvariable (_menhir_stack, _v_0, _startpos_1) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lopar ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | Lvariable _v_2 ->
                      _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState04
                  | Lfpar ->
                      let _v_3 = _menhir_action_03 () in
                      _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState04
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvirgule ->
          let _menhir_stack = MenhirCell1_Lvariable (_menhir_stack, _menhir_s, _v, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lvariable _v_0 ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState06
          | Lfpar ->
              let _v_1 = _menhir_action_03 () in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
          | _ ->
              _eRR ())
      | Lfpar ->
          let _1 = _v in
          let _v = _menhir_action_01 _1 in
          _menhir_goto_arg_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_Lvariable -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Lvariable (_menhir_stack, _menhir_s, _1, _) = _menhir_stack in
      let args = _v in
      let _v = _menhir_action_02 _1 args in
      _menhir_goto_arg_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_arg_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState04 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState06 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Ldef _menhir_cell0_Ltypes _menhir_cell0_Lvariable as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_arg_list (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lobra ->
          let _menhir_s = MenhirState10 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lvariable _v ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Ltypes _v ->
              _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lprintf ->
              _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lloop ->
              _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lif ->
              _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lend ->
              _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lvariable (_menhir_stack, _menhir_s, _v, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lassigne ->
          let _menhir_s = MenhirState12 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lvariable _v ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Ltrue _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lstring _v ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lnot ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lint _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lfalse _v ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_v_, v) = (_startpos, _v) in
      let _v = _menhir_action_14 _startpos_v_ v in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_v_ _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState71 ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState67 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState55 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_72 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lobra ->
          let _menhir_s = MenhirState73 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lvariable _v ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Ltypes _v ->
              _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lprintf ->
              _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lloop ->
              _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lif ->
              _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lend ->
              _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | Lneq ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lxor (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState20 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_12 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_b_ _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_s_, s) = (_startpos, _v) in
      let _v = _menhir_action_11 _startpos_s_ s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_s_ _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lnot (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState16 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_n_, n) = (_startpos, _v) in
      let _v = _menhir_action_10 _startpos_n_ n in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_n_ _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_13 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_b_ _v _menhir_s _tok
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lsub (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState22 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lplus (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState24 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lor (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState26 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_52 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v_0 ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lfin ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (v, _startpos_t_, t) = (_v_0, _startpos, _v) in
              let _v = _menhir_action_32 _startpos_t_ t v in
              _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | Lassigne ->
              let _menhir_stack = MenhirCell1_Ltypes (_menhir_stack, _menhir_s, _v, _startpos) in
              let _menhir_stack = MenhirCell0_Lvariable (_menhir_stack, _v_0, _startpos_1) in
              let _menhir_s = MenhirState55 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lvariable _v ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Ltrue _v ->
                  _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lstring _v ->
                  _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lnot ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lint _v ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lfalse _v ->
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_instruction : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lvariable _v_0 ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState75
      | Ltypes _v_1 ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState75
      | Lprintf ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | Lloop ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | Lif ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | Lend ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | Lfbra ->
          let _1 = _v in
          let _v = _menhir_action_04 _1 in
          _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_58 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lopar ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lvariable _v ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lfpar ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | Lfin ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_startpos_e_, e) = (_startpos, _v) in
                      let _v = _menhir_action_34 _startpos_e_ e in
                      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | Ladd | Land | Ldiv | Leq | Lge | Lgt | Lle | Llt | Lmod | Lmul | Lneq | Lor | Lplus | Lsub | Lxor ->
                  let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
                  let _v =
                    let (_startpos_v_, v) = (_startpos, _v) in
                    _menhir_action_14 _startpos_v_ v
                  in
                  _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v MenhirState59 _tok
              | _ ->
                  _eRR ())
          | Ltrue _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59
          | Lstring _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59
          | Lnot ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | Lint _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59
          | Lfalse _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_63 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lprintf as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfpar ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lfin ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_Lprintf (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_startpos_e_, e) = (_startpos, _v) in
              let _v = _menhir_action_35 _startpos_e_ e in
              _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lneq (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState28 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lmul (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState30 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lmod (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState32 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Llt (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState34 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lle (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState36 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lgt (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState38 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lge (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState40 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Leq (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState42 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Ldiv (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState44 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Land (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState46 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Ladd (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState48 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_66 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lloop (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lopar ->
          let _menhir_s = MenhirState67 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lvariable _v ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Ltrue _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lstring _v ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lnot ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lint _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lfalse _v ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_71 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lif (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState71 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltrue _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_74 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_06 () in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState10 ->
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState70 ->
          _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState80 ->
          _menhir_run_81 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState73 ->
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState75 ->
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_85 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Ldef _menhir_cell0_Ltypes _menhir_cell0_Lvariable, _menhir_box_prog) _menhir_cell1_arg_list -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | Lfbra ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_arg_list (_menhir_stack, _, args) = _menhir_stack in
          let MenhirCell0_Lvariable (_menhir_stack, name, _startpos_name_) = _menhir_stack in
          let MenhirCell0_Ltypes (_menhir_stack, typ, _) = _menhir_stack in
          let MenhirCell1_Ldef (_menhir_stack, _menhir_s) = _menhir_stack in
          let block = _v in
          let _v = _menhir_action_09 _startpos_name_ args block name typ in
          (match (_tok : MenhirBasics.token) with
          | Ldef ->
              let _menhir_stack = MenhirCell1_def (_menhir_stack, _menhir_s, _v) in
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState88
          | Lend ->
              let _1 = _v in
              let _v = _menhir_action_07 _1 in
              _menhir_goto_code _menhir_stack _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_83 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lloop, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | Lfbra ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expr (_menhir_stack, _, e, _) = _menhir_stack in
          let MenhirCell1_Lloop (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_37 _startpos__1_ b e in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_81 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | Lfbra ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_block (_menhir_stack, _, tb) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, e, _) = _menhir_stack in
          let MenhirCell1_Lif (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let fb = _v in
          let _v = _menhir_action_36 _startpos__1_ e fb tb in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_77 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_block (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Lfbra ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lelse ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lobra ->
                  let _menhir_s = MenhirState80 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | Lvariable _v ->
                      _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | Ltypes _v ->
                      _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | Lprintf ->
                      _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lloop ->
                      _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lif ->
                      _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lend ->
                      _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_76 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_instruction -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_instruction (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_05 _1 _2 in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_68 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lloop as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfpar ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lobra ->
              let _menhir_s = MenhirState70 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lvariable _v ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Ltypes _v ->
                  _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lprintf ->
                  _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lloop ->
                  _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lif ->
                  _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lend ->
                  _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | Leq ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_56 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Ltypes _menhir_cell0_Lvariable as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_Lvariable (_menhir_stack, v, _) = _menhir_stack in
          let MenhirCell1_Ltypes (_menhir_stack, _menhir_s, d, _startpos_d_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_31 _startpos_d_ d e v in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lvariable as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Lvariable (_menhir_stack, _menhir_s, v, _startpos_v_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_33 _startpos_v_ e v in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_49 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Ladd as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Ladd (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_23 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Land as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Land (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_28 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Ldiv as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Ldiv (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_26 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Leq as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Leq (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_17 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lge as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lge (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_22 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lgt as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lgt (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_20 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lle as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lle (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_21 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Llt as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Llt (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_19 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lmod as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lmod (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_27 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lmul as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lmul (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_25 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lneq as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lneq (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_18 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lor as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lor (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_29 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lplus as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra | Lplus ->
          let MenhirCell0_Lplus (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_15 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lsub as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lsub (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_24 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lxor as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell0_Lxor (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_30 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lnot as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lxor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lsub ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lor ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmul ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lmod ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ldiv ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Land ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Ladd ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lobra ->
          let MenhirCell1_Lnot (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_16 _startpos__1_ e in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ldef ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
