
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
    | Lint of (
# 6 "parser.mly"
       (int)
# 43 "parser.ml"
  )
    | Lif
    | Lfpar
    | Lfin
    | Lfalse of (
# 8 "parser.mly"
       (bool)
# 51 "parser.ml"
  )
    | Lend
    | Lelse
    | Lcbra
    | Lassigne
  
end

include MenhirBasics

# 1 "parser.mly"
  
open Ast

# 66 "parser.ml"

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

  | MenhirState16 : (('s, _menhir_box_prog) _menhir_cell1_Lreturn, _menhir_box_prog) _menhir_state
    (** State 16.
        Stack shape : Lreturn.
        Start symbol: prog. *)

  | MenhirState20 : (('s, _menhir_box_prog) _menhir_cell1_Lprintf, _menhir_box_prog) _menhir_state
    (** State 20.
        Stack shape : Lprintf.
        Start symbol: prog. *)

  | MenhirState25 : (('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_state
    (** State 25.
        Stack shape : Lif.
        Start symbol: prog. *)

  | MenhirState28 : ((('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 28.
        Stack shape : Lif expr.
        Start symbol: prog. *)

  | MenhirState30 : (('s, _menhir_box_prog) _menhir_cell1_instr, _menhir_box_prog) _menhir_state
    (** State 30.
        Stack shape : instr.
        Start symbol: prog. *)

  | MenhirState35 : (((('s, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_block, _menhir_box_prog) _menhir_state
    (** State 35.
        Stack shape : Lif expr block.
        Start symbol: prog. *)

  | MenhirState40 : (('s, _menhir_box_prog) _menhir_cell1_instr, _menhir_box_prog) _menhir_state
    (** State 40.
        Stack shape : instr.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_block = 
  | MenhirCell1_block of 's * ('s, 'r) _menhir_state * (Ast.Syntax.block)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.Syntax.expr) * Lexing.position

and ('s, 'r) _menhir_cell1_instr = 
  | MenhirCell1_instr of 's * ('s, 'r) _menhir_state * (Ast.Syntax.instruction)

and ('s, 'r) _menhir_cell1_Lif = 
  | MenhirCell1_Lif of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_Lnot = 
  | MenhirCell1_Lnot of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_Lplus = 
  | MenhirCell0_Lplus of 's * Lexing.position

and ('s, 'r) _menhir_cell1_Lprintf = 
  | MenhirCell1_Lprintf of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Lreturn = 
  | MenhirCell1_Lreturn of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_Lvariable = 
  | MenhirCell1_Lvariable of 's * ('s, 'r) _menhir_state * (
# 7 "parser.mly"
       (string)
# 153 "parser.ml"
) * Lexing.position

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.Syntax.prog) [@@unboxed]

let _menhir_action_01 =
  fun b i ->
    (
# 29 "parser.mly"
                        ( i :: b )
# 164 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_02 =
  fun () ->
    (
# 30 "parser.mly"
       ( [] )
# 172 "parser.ml"
     : (Ast.Syntax.block))

let _menhir_action_03 =
  fun _startpos_n_ n ->
    (
# 34 "parser.mly"
           ( Int { value = n ; pos = _startpos_n_ } )
# 180 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_04 =
  fun _startpos_s_ s ->
    (
# 35 "parser.mly"
              ( String { value = s; pos = _startpos_s_ } )
# 188 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_05 =
  fun _startpos_b_ b ->
    (
# 36 "parser.mly"
            ( Bool { value = b; pos = _startpos_b_ } )
# 196 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_06 =
  fun _startpos_b_ b ->
    (
# 37 "parser.mly"
             ( Bool { value = b; pos = _startpos_b_ } )
# 204 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_07 =
  fun _startpos__2_ a b ->
    (
# 38 "parser.mly"
                              (
  Call { func = "_add" ; args = [ a ; b ] ; pos = _startpos__2_ }
)
# 214 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_08 =
  fun _startpos__1_ e ->
    (
# 41 "parser.mly"
                ( Call { func = "_not"; args = [e]; pos = _startpos__1_ } )
# 222 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_09 =
  fun _startpos_t_ t v ->
    let _startpos = _startpos_t_ in
    (
# 44 "parser.mly"
                                    ( Decl { name = v; typ = t; pos = _startpos } )
# 231 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_10 =
  fun _startpos_v_ e v ->
    let _startpos = _startpos_v_ in
    (
# 45 "parser.mly"
                                             ( Assigne { name = v; expr = e; pos = _startpos } )
# 240 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_11 =
  fun _startpos_r_ e r ->
    (
# 46 "parser.mly"
                                ( Retourne { expr = e; pos = _startpos_r_ } )
# 248 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_12 =
  fun _startpos_e_ e ->
    (
# 47 "parser.mly"
                                        ( Print { expr = e; type_ = Int_t ; pos = _startpos_e_ })
# 256 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_13 =
  fun _startpos__1_ e fb tb ->
    (
# 49 "parser.mly"
                                                                                         ( Condition { compar = e; tblock = tb; fblock = fb; pos = _startpos__1_ })
# 264 "parser.ml"
     : (Ast.Syntax.instruction))

let _menhir_action_14 =
  fun e p ->
    (
# 24 "parser.mly"
                       ( e :: p )
# 272 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_action_15 =
  fun () ->
    (
# 25 "parser.mly"
       ( [] )
# 280 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Lassigne ->
        "Lassigne"
    | Lcbra ->
        "Lcbra"
    | Lelse ->
        "Lelse"
    | Lend ->
        "Lend"
    | Lfalse _ ->
        "Lfalse"
    | Lfin ->
        "Lfin"
    | Lfpar ->
        "Lfpar"
    | Lif ->
        "Lif"
    | Lint _ ->
        "Lint"
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
  
  let _menhir_run_39 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_39 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_41 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_instr -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_instr (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_14 e p in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let _menhir_run_38 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_15 () in
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
      let _v = _menhir_action_05 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_b_ _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState05 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfpar ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lobra ->
              let _menhir_s = MenhirState28 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lvariable _v ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Ltypes _v ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lreturn ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lprintf ->
                  _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lif ->
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Lend ->
                  _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
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
      let _v = _menhir_action_04 _startpos_s_ s in
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
      let _v = _menhir_action_03 _startpos_n_ n in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_n_ _v _menhir_s _tok
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_06 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_b_ _v _menhir_s _tok
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lfin ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (v, _startpos_t_, t) = (_v_0, _startpos, _v) in
              let _v = _menhir_action_09 _startpos_t_ t v in
              _menhir_goto_instr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_instr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState40 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState35 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_instr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState40
      | Ltypes _v_1 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState40
      | Lreturn ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | Lprintf ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | Lif ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | Lend ->
          _menhir_run_38 _menhir_stack MenhirState40
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lreturn (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState16 in
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
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Lprintf (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lopar ->
          let _menhir_s = MenhirState20 in
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
  
  and _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lif (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lopar ->
          let _menhir_s = MenhirState25 in
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
  
  and _menhir_run_30 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_instr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Lvariable _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState30
      | Ltypes _v_1 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState30
      | Lreturn ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Lprintf ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Lif ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Lend ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_02 () in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState35 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_36 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | Lcbra ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_block (_menhir_stack, _, tb) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, e, _) = _menhir_stack in
          let MenhirCell1_Lif (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let fb = _v in
          let _v = _menhir_action_13 _startpos__1_ e fb tb in
          _menhir_goto_instr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_Lif, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_block (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Lcbra ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lelse ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Lobra ->
                  let _menhir_s = MenhirState35 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | Lvariable _v ->
                      _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | Ltypes _v ->
                      _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | Lreturn ->
                      _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lprintf ->
                      _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lif ->
                      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | Lend ->
                      _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_instr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_instr (_menhir_stack, _menhir_s, i) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_01 b i in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lprintf as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfpar ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lfin ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_Lprintf (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_startpos_e_, e) = (_startpos, _v) in
              let _v = _menhir_action_12 _startpos_e_ e in
              _menhir_goto_instr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lreturn as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Lreturn (_menhir_stack, _menhir_s, _startpos_r_) = _menhir_stack in
          let (e, r) = (_v, ()) in
          let _v = _menhir_action_11 _startpos_r_ e r in
          _menhir_goto_instr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lvariable as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Lvariable (_menhir_stack, _menhir_s, v, _startpos_v_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_10 _startpos_v_ e v in
          _menhir_goto_instr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr _menhir_cell0_Lplus -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_Lplus (_menhir_stack, _startpos__2_) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, a, _startpos_a_) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_07 _startpos__2_ a b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_a_ _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lnot as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Lfin | Lfpar ->
          let MenhirCell1_Lnot (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_08 _startpos__1_ e in
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
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lreturn ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lprintf ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lif ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lend ->
          _menhir_run_38 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
