
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | Lvirgule
    | Lvariable of (
# 7 "parser.mly"
       (string)
# 16 "parser.ml"
  )
    | Ltypes of (
# 9 "parser.mly"
       (Ast.base_t)
# 21 "parser.ml"
  )
    | Ltrue of (
# 8 "parser.mly"
       (bool)
# 26 "parser.ml"
  )
    | Lstring of (
# 7 "parser.mly"
       (string)
# 31 "parser.ml"
  )
    | Lscanf
    | Lreturn
    | Lprintf
    | Lplus
    | Lopar
    | Lobra
    | Lnot
    | Lneq
    | Llt
    | Lle
    | Lint of (
# 6 "parser.mly"
       (int)
# 46 "parser.ml"
  )
    | Lif
    | Lgt
    | Lge
    | Lfpar
    | Lfin
    | Lfbra
    | Lfalse of (
# 8 "parser.mly"
       (bool)
# 57 "parser.ml"
  )
    | Leq
    | Lend
    | Lelse
    | Lassigne
  
end

include MenhirBasics

# 1 "parser.mly"
  
open Ast

# 72 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState02 : (('s, _menhir_box_prog) _menhir_cell1_Lvariable, _menhir_box_prog) _menhir_state
    (** State 02.
        Stack shape : Lvariable.
        Start symbol: prog. *)

  | MenhirState05 : (('s, _menhir_box_prog) _menhir_cell1_Lnot, _menhir_box_prog) _menhir_state
    (** State 05.
        Stack shape : Lnot.
        Start symbol: prog. *)

  | MenhirState09 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lplus, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : expr Lplus.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lneq, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : expr Lneq.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Llt, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : expr Llt.
        Start symbol: prog. *)

  | MenhirState15 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lle, _menhir_box_prog) _menhir_state
    (** State 15.
        Stack shape : expr Lle.
        Start symbol: prog. *)

  | MenhirState17 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lgt, _menhir_box_prog) _menhir_state
    (** State 17.
        Stack shape : expr Lgt.
        Start symbol: prog. *)

  | MenhirState19 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lge, _menhir_box_prog) _menhir_state
    (** State 19.
        Stack shape : expr Lge.
        Start symbol: prog. *)

  | MenhirState21 : (('s, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Leq, _menhir_box_prog) _menhir_state
    (** State 21.
        Stack shape : expr Leq.
        Start symbol: prog. *)

  | MenhirState28 : (('s, _menhir_box_prog) _menhir_cell1_Ltypes _menhir_cell0_Lvariable, _menhir_box_prog) _menhir_state
    (** State 28.
        Stack shape : Ltypes Lvariable.
        Start symbol: prog. *)

  | MenhirState32 : (('s, _menhir_box_prog) _menhir_cell1_Lprintf, _menhir_box_prog) _menhir_state
    (** State 32.
        Stack shape : Lprintf.
        Start symbol: prog. *)

  | MenhirState40 : (('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_state
    (** State 40.
        Stack shape : Lif.
        Start symbol: prog. *)

  | MenhirState43 : ((('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 43.
        Stack shape : Lif expr.
        Start symbol: prog. *)

  | MenhirState45 : (('s, _menhir_box_prog) _menhir_cell1_instruction, _menhir_box_prog) _menhir_state
    (** State 45.
        Stack shape : instruction.
        Start symbol: prog. *)

  | MenhirState50 : (((('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_block, _menhir_box_prog) _menhir_state
    (** State 50.
        Stack shape : Lif expr block.
        Start symbol: prog. *)

  | MenhirState55 : (('s, _menhir_box_prog) _menhir_cell1_instruction, _menhir_box_prog) _menhir_state
    (** State 55.
        Stack shape : instruction.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_block = 
  | MenhirCell1_block of 's * ('s, 'r) _menhir_state * (Ast.Syntax.block)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.Syntax.expr) * Lexing.position

and ('s, 'r) _menhir_cell1_instruction = 
  | MenhirCell1_instruction of 's * ('s, 'r) _menhir_state * (Ast.Syntax.instruction)

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

and 's _menhir_cell0_Llt = 
  | MenhirCell0_Llt of 's * Lexing.position

and 's _menhir_cell0_Lneq = 
  | MenhirCell0_Lneq of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Lnot = 
  | MenhirCell1_Lnot of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_Lplus = 
  | MenhirCell0_Lplus of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Lprintf = 
  | MenhirCell1_Lprintf of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Ltypes = 
  | MenhirCell1_Ltypes of 's * ('s, 'r) _menhir_state * (
# 9 "parser.mly"
       (Ast.base_t)
# 204 "parser.ml"
) * Lexing.position

and ('s, 'r) _menhir_cell1_Lvariable = 
  | MenhirCell1_Lvariable of 's * ('s, 'r) _menhir_state * (
# 7 "parser.mly"
       (string)
# 211 "parser.ml"
) * Lexing.position

and 's _menhir_cell0_Lvariable = 
  | MenhirCell0_Lvariable of 's * (
# 7 "parser.mly"
       (string)
# 218 "parser.ml"
) * Lexing.position

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.Syntax.prog) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 30 "parser.mly"
                     ( [_1] )
# 229 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_02 =
  fun _1 _2 ->
    (
# 31 "parser.mly"
                    ( _1::_2 )
# 237 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_03 =
  fun () ->
    (
# 32 "parser.mly"
               ( [] )
# 245 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_04 =
  fun _startpos_n_ n ->
    (
# 36 "parser.mly"
           ( Int { value = n ; pos = _startpos_n_ } )
# 253 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_05 =
  fun _startpos_s_ s ->
    (
# 37 "parser.mly"
              ( String { value = s; pos = _startpos_s_ } )
# 261 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_06 =
  fun _startpos_b_ b ->
    (
# 38 "parser.mly"
            ( Bool { value = b; pos = _startpos_b_ } )
# 269 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_07 =
  fun _startpos_b_ b ->
    (
# 39 "parser.mly"
             ( Bool { value = b; pos = _startpos_b_ } )
# 277 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_08 =
  fun _startpos__2_ a b ->
    (
# 40 "parser.mly"
                              ( Call { func = "_add" ; args = [ a ; b ] ; pos = _startpos__2_ })
# 285 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_09 =
  fun _startpos__1_ e ->
    (
# 41 "parser.mly"
                ( Call { func = "_not"; args = [e]; pos = _startpos__1_ } )
# 293 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_10 =
  fun _1 _3 _startpos__2_ ->
    (
# 42 "parser.mly"
                ( Call { func = "%eq"; args = [_1; _3]; pos = _startpos__2_ } )
# 301 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_11 =
  fun _1 _3 _startpos__2_ ->
    (
# 43 "parser.mly"
                 ( Call { func = "%neq"; args = [_1; _3]; pos = _startpos__2_ } )
# 309 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_12 =
  fun _1 _3 _startpos__2_ ->
    (
# 44 "parser.mly"
                ( Call { func = "%lt"; args = [_1; _3]; pos = _startpos__2_ } )
# 317 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_13 =
  fun _1 _3 _startpos__2_ ->
    (
# 45 "parser.mly"
                ( Call { func = "%gt"; args = [_1; _3]; pos = _startpos__2_ } )
# 325 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_14 =
  fun _1 _3 _startpos__2_ ->
    (
# 46 "parser.mly"
                ( Call { func = "%le"; args = [_1; _3]; pos = _startpos__2_ } )
# 333 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_15 =
  fun _1 _3 _startpos__2_ ->
    (
# 47 "parser.mly"
                ( Call { func = "%ge"; args = [_1; _3]; pos = _startpos__2_ } )
# 341 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_16 =
  fun _startpos_d_ d e v ->
    let _startpos = _startpos_d_ in
    (
# 50 "parser.mly"
                                                         ( DeclAssigne { name = v; typ = d ; expr = e; pos = _startpos })
# 350 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_17 =
  fun _startpos_t_ t v ->
    let _startpos = _startpos_t_ in
    (
# 51 "parser.mly"
                                    ( Decl { name = v; typ = t; pos = _startpos } )
# 359 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_18 =
  fun _startpos_v_ e v ->
    let _startpos = _startpos_v_ in
    (
# 52 "parser.mly"
                                             ( Assigne { name = v; expr = e; pos = _startpos } )
# 368 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_19 =
  fun _startpos_e_ e ->
    (
# 54 "parser.mly"
                                             ( Print { expr = Var { name = e; pos = _startpos_e_ }; type_ = Int_t ; pos = _startpos_e_ })
# 376 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_20 =
  fun _startpos_e_ e ->
    (
# 55 "parser.mly"
                                        ( Print { expr = e; type_ = Int_t ; pos = _startpos_e_ })
# 384 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_21 =
  fun _startpos__1_ e fb tb ->
    (
# 57 "parser.mly"
                                                                                         ( Condition { compar = e; tblock = tb; fblock = fb; pos = _startpos__1_ })
# 392 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_22 =
  fun e p ->
    (
# 25 "parser.mly"
                             ( e :: p )
# 400 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_action_23 =
  fun () ->
    (
# 26 "parser.mly"
       ( [] )
# 408 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Lassigne ->
        "Lassigne"
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
    | Llt ->
        "Llt"
    | Lneq ->
        "Lneq"
    | Lnot ->
        "Lnot"
    | Lobra ->
        "Lobra"
    | Lopar ->
        "Lopar"
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
    | Ltrue _ ->
        "Ltrue"
    | Ltypes _ ->
        "Ltypes"
    | Lvariable _ ->
        "Lvariable"
    | Lvirgule ->
        "Lvirgule"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_54 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState55 ->
          _menhir_run_56 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_54 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_56 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_instruction -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_instruction (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_22 e p in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let _menhir_run_53 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_23 () in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lvariable (_menhir_stack, _menhir_s, _v, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lassigne ->
          let _menhir_s = MenhirState02 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Ltrue _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lstring _v ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lnot ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lint _v ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lfalse _v ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_06 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_b_ _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfpar ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lobra ->
              let _menhir_s = MenhirState43 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lvariable _v ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Ltypes _v ->
                  _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lprintf ->
                  _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lif ->
                  _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lend ->
                  _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | Leq ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lplus (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState09 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_s_, s) = (_startpos, _v) in
      let _v = _menhir_action_05 _startpos_s_ s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_s_ _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lnot (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState05 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_n_, n) = (_startpos, _v) in
      let _v = _menhir_action_04 _startpos_n_ n in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_n_ _v _menhir_s _tok
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_07 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_b_ _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lneq (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState11 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Llt (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lle (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState15 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lgt (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState17 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Lge (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState19 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
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
              let _v = _menhir_action_17 _startpos_t_ t v in
              _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | Lassigne ->
              let _menhir_stack = MenhirCell1_Ltypes (_menhir_stack, _menhir_s, _v, _startpos) in
              let _menhir_stack = MenhirCell0_Lvariable (_menhir_stack, _v_0, _startpos_1) in
              let _menhir_s = MenhirState28 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Ltrue _v ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lstring _v ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lnot ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lint _v ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lfalse _v ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_instruction : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState55 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState45 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState43 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_55 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState55
      | Ltypes _v_1 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState55
      | Lprintf ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | Lif ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | Lend ->
          _menhir_run_53 _menhir_stack MenhirState55
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
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
                      let _v = _menhir_action_19 _startpos_e_ e in
                      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | Ltrue _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
          | Lstring _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
          | Lnot ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | Lint _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
          | Lfalse _v ->
              let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lif (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lopar ->
          let _menhir_s = MenhirState40 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Ltrue _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lstring _v ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lnot ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Lint _v ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lfalse _v ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lvariable _v_0 ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState45
      | Ltypes _v_1 ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState45
      | Lprintf ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
      | Lif ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
      | Lend ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
      | Lfbra ->
          let _1 = _v in
          let _v = _menhir_action_01 _1 in
          _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_03 () in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState50 ->
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState43 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState45 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_51 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | Lfbra ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_block (_menhir_stack, _, tb) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, e, _) = _menhir_stack in
          let MenhirCell1_Lif (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let fb = _v in
          let _v = _menhir_action_21 _startpos__1_ e fb tb in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
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
                  let _menhir_s = MenhirState50 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | Lvariable _v ->
                      _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | Ltypes _v ->
                      _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | Lprintf ->
                      _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lif ->
                      _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lend ->
                      _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_instruction -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_instruction (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_02 _1 _2 in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_Leq (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState21 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lprintf as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfpar ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lfin ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_Lprintf (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_startpos_e_, e) = (_startpos, _v) in
              let _v = _menhir_action_20 _startpos_e_ e in
              _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Ltypes _menhir_cell0_Lvariable as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_Lvariable (_menhir_stack, v, _) = _menhir_stack in
          let MenhirCell1_Ltypes (_menhir_stack, _menhir_s, d, _startpos_d_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_16 _startpos_d_ d e v in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lvariable as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Lvariable (_menhir_stack, _menhir_s, v, _startpos_v_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_18 _startpos_v_ e v in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Leq as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell0_Leq (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_10 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lge as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell0_Lge (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_15 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lgt as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell0_Lgt (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_13 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lle as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell0_Lle (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_14 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Llt as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell0_Llt (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_12 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lneq as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell0_Lneq (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_11 _1 _3 _startpos__2_ in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lplus as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar | Lplus ->
          let MenhirCell0_Lplus (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_08 _startpos__2_ a b in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lnot as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lneq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Llt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lle ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lgt ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lge ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Leq ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell1_Lnot (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_09 _startpos__1_ e in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Ltypes _v ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lprintf ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lif ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lend ->
          _menhir_run_53 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
