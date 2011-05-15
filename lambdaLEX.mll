(*   File lambdaLEX.mll  *)

(*
 * e ::=                      expression
 *   x                        identifier
 * | c                        constant
 * | op                       operator
 * | fun x -> e               function
 * | e e                      application
 * | (e, e)                   pair
 * | let x = e in e           local binding
 * | let rec x = e in e       recursion
 *)  
{
open LambdaYACC;;
exception Eof;;
} 
rule token = parse
  [' ' '\t']       { token lexbuf        } (* skip blanks and tabs *)
| ['\n' ]          { EOL                 }
| 'x' as x         { ID (Char.escaped x) }
| '1'              { NUM 1               } 
| '='              { EQ                  }
| '+'              { OP                  }
| ','              { COMMA               }
| '('              { LPAREN              }
| ')'              { RPAREN              }
| "fun"            { FUN                 }
| "in"             { IN                  }
| "let"            { LET                 }
| "rec"            { REC                 }
| "->"             { ARROW               }
| eof              { raise Eof           }
