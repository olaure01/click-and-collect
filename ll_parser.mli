type token =
  | THESIS
  | COMMA
  | LITT of (string)
  | LPAREN
  | RPAREN
  | EOL
  | ORTH
  | TENSOR
  | PAR
  | WITH
  | PLUS
  | ONE
  | BOTTOM
  | TOP
  | ZERO
  | LOLLIPOP
  | OFCOURSE
  | WHYNOT

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Sequent.sequent
