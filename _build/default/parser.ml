
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | Ltrue of (
# 4 "parser.mly"
       (bool)
# 15 "parser.ml"
  )
    | Lstring of (
# 3 "parser.mly"
       (string)
# 20 "parser.ml"
  )
    | Lplus
    | Lnot
    | Lint of (
# 2 "parser.mly"
       (int)
# 27 "parser.ml"
  )
    | Lfalse of (
# 4 "parser.mly"
       (bool)
# 32 "parser.ml"
  )
    | Lend
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState03 : (('s, _menhir_box_prog) _menhir_cell1_Lnot, _menhir_box_prog) _menhir_state
    (** State 03.
        Stack shape : Lnot.
        Start symbol: prog. *)

  | MenhirState06 : ((('s, _menhir_box_prog) _menhir_cell1_Lnot, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 06.
        Stack shape : Lnot expr.
        Start symbol: prog. *)

  | MenhirState07 : ((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_Lplus, _menhir_box_prog) _menhir_state
    (** State 07.
        Stack shape : expr Lplus.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : expr.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.Syntax.expr)

and ('s, 'r) _menhir_cell1_Lnot = 
  | MenhirCell1_Lnot of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_Lplus = 
  | MenhirCell1_Lplus of 's * ('s, 'r) _menhir_state * Lexing.position

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.Syntax.prog) [@@unboxed]

let _menhir_action_01 =
  fun _startpos_n_ n ->
    (
# 21 "parser.mly"
           ( Int { value = n ; pos = _startpos_n_ } )
# 84 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_02 =
  fun _startpos_s_ s ->
    (
# 22 "parser.mly"
              ( String { value = s; pos = _startpos_s_ } )
# 92 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_03 =
  fun _startpos_b_ b ->
    (
# 23 "parser.mly"
            ( Bool { value = b; pos = _startpos_b_ } )
# 100 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_04 =
  fun _startpos_b_ b ->
    (
# 24 "parser.mly"
             ( Bool { value = b; pos = _startpos_b_ } )
# 108 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_05 =
  fun _startpos_v_ v ->
    (
# 25 "parser.mly"
              ( Var { name = v; pos = _startpos_v_ } )
# 116 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_06 =
  fun _startpos__2_ a b ->
    (
# 26 "parser.mly"
                              (
  Call { func = "_add" ; args = [ a ; b ] ; pos = _startpos__2_ }
)
# 126 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_07 =
  fun _startpos__1_ e ->
    (
# 29 "parser.mly"
                ( Call { func = "_not"; args = [e]; pos = _startpos__1_ } )
# 134 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_08 =
  fun e p ->
    (
# 16 "parser.mly"
                      ( e :: p )
# 142 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_action_09 =
  fun () ->
    (
# 17 "parser.mly"
       ( [] )
# 150 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Lend ->
        "Lend"
    | Lfalse _ ->
        "Lfalse"
    | Lint _ ->
        "Lint"
    | Lnot ->
        "Lnot"
    | Lplus ->
        "Lplus"
    | Lstring _ ->
        "Lstring"
    | Ltrue _ ->
        "Ltrue"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_10 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_08 e p in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let _menhir_run_09 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_09 () in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_03 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState11 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState11
      | Lstring _v_1 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState11
      | Lplus ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | Lnot ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | Lint _v_2 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState11
      | Lfalse _v_3 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState11
      | Lend ->
          _menhir_run_09 _menhir_stack MenhirState11
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_s_, s) = (_startpos, _v) in
      let _v = _menhir_action_02 _startpos_s_ s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_07 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lplus (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_Lnot (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState03 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_n_, n) = (_startpos, _v) in
      let _v = _menhir_action_01 _startpos_n_ n in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_04 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_Lplus -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Lplus (_menhir_stack, _, _startpos__2_) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_06 _startpos__2_ a b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_06 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_Lnot as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Lplus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | Lend | Lfalse _ | Lint _ | Lnot | Lstring _ | Ltrue _ ->
          let MenhirCell1_Lnot (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_07 _startpos__1_ e in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lstring _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lnot ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Lint _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lend ->
          _menhir_run_09 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
