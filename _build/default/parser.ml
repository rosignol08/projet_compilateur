
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
    | Lint of (
# 2 "parser.mly"
       (int)
# 26 "parser.ml"
  )
    | Lfalse of (
# 4 "parser.mly"
       (bool)
# 31 "parser.ml"
  )
    | Lend
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState07 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 07.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState08 : ((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_Lplus, _menhir_box_prog) _menhir_state
    (** State 08.
        Stack shape : expr Lplus.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.Syntax.expr)

and ('s, 'r) _menhir_cell1_Lplus = 
  | MenhirCell1_Lplus of 's * ('s, 'r) _menhir_state * Lexing.position

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.Syntax.prog) [@@unboxed]

let _menhir_action_1 =
  fun _startpos_n_ n ->
    (
# 20 "parser.mly"
           ( Int { value = n ; pos = _startpos_n_ } )
# 70 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_2 =
  fun _startpos_s_ s ->
    (
# 21 "parser.mly"
              ( String { value = s; pos = _startpos_s_ } )
# 78 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_3 =
  fun _startpos_b_ b ->
    (
# 22 "parser.mly"
            ( Bool { value = b; pos = _startpos_b_ } )
# 86 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_4 =
  fun _startpos_b_ b ->
    (
# 23 "parser.mly"
             ( Bool { value = b; pos = _startpos_b_ } )
# 94 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_5 =
  fun _startpos__2_ a b ->
    (
# 24 "parser.mly"
                              (
  Call { func = "_add" ; args = [ a ; b ] ; pos = _startpos__2_ }
)
# 104 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_6 =
  fun e p ->
    (
# 15 "parser.mly"
                      ( e :: p )
# 112 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_action_7 =
  fun () ->
    (
# 16 "parser.mly"
       ( [] )
# 120 "parser.ml"
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
  
  let _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState07 ->
          _menhir_run_10 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_06 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_6 e p in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let _menhir_run_05 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_7 () in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_3 _startpos_b_ b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState08 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_Lplus -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Lplus (_menhir_stack, _, _startpos__2_) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_5 _startpos__2_ a b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Ltrue _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState07
      | Lstring _v_1 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState07
      | Lplus ->
          let _menhir_s = MenhirState07 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_Lplus (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState08 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Ltrue _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lstring _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lint _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lfalse _v ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | Lint _v_6 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState07
      | Lfalse _v_7 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState07
      | Lend ->
          _menhir_run_05 _menhir_stack MenhirState07
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_s_, s) = (_startpos, _v) in
      let _v = _menhir_action_2 _startpos_s_ s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_n_, n) = (_startpos, _v) in
      let _v = _menhir_action_1 _startpos_n_ n in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_b_, b) = (_startpos, _v) in
      let _v = _menhir_action_4 _startpos_b_ b in
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
      | Lint _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lfalse _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lend ->
          _menhir_run_05 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
