
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | Lstring of (
# 3 "parser.mly"
       (string)
# 15 "parser.ml"
  )
    | Lplus
    | Lint of (
# 2 "parser.mly"
       (int)
# 21 "parser.ml"
  )
    | Lend
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState0 : ('s, _menhir_box_prog) _menhir_state
    (** State 0.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState5 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 5.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState6 : ((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_Lplus, _menhir_box_prog) _menhir_state
    (** State 6.
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
# 19 "parser.mly"
           ( Int { value = n ; pos = _startpos_n_ } )
# 60 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_2 =
  fun _startpos_s_ s ->
    (
# 20 "parser.mly"
              ( String { value = s; pos = _startpos_s_ } )
# 68 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_3 =
  fun _startpos__2_ a b ->
    (
# 21 "parser.mly"
                              (
  Call { func = "_add" ; args = [ a ; b ] ; pos = _startpos__2_ }
)
# 78 "parser.ml"
     : (Ast.Syntax.expr))

let _menhir_action_4 =
  fun e p ->
    (
# 14 "parser.mly"
                      ( e :: p )
# 86 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_action_5 =
  fun () ->
    (
# 15 "parser.mly"
       ( [] )
# 94 "parser.ml"
     : (Ast.Syntax.prog))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Lend ->
        "Lend"
    | Lint _ ->
        "Lint"
    | Lplus ->
        "Lplus"
    | Lstring _ ->
        "Lstring"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_4 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState5 ->
          _menhir_run_8 _menhir_stack _v
      | MenhirState0 ->
          _menhir_run_4 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_8 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_4 e p in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let _menhir_run_3 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_5 () in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let rec _menhir_run_1 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_s_, s) = (_startpos, _v) in
      let _v = _menhir_action_2 _startpos_s_ s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState6 ->
          _menhir_run_7 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState5 ->
          _menhir_run_5 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState0 ->
          _menhir_run_5 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_7 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_Lplus -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Lplus (_menhir_stack, _, _startpos__2_) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_3 _startpos__2_ a b in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_5 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Lstring _v_0 ->
          _menhir_run_1 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState5
      | Lplus ->
          let _menhir_s = MenhirState5 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_Lplus (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState6 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Lstring _v ->
              _menhir_run_1 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lint _v ->
              _menhir_run_2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | Lint _v_3 ->
          _menhir_run_2 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState5
      | Lend ->
          _menhir_run_3 _menhir_stack MenhirState5
  
  and _menhir_run_2 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_startpos_n_, n) = (_startpos, _v) in
      let _v = _menhir_action_1 _startpos_n_ n in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState0 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Lstring _v ->
          _menhir_run_1 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lint _v ->
          _menhir_run_2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lend ->
          _menhir_run_3 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
