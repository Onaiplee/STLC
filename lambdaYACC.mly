/* File lambdaYACC.mly */

%{
%}

%token EOL EQ LPAREN RPAREN FUN IN LET REC ARROW
%token < int > NUM
%token < string > ID
%type <unit> prog
%type <aexpr> expr
%start prog

%%
prog :
  expr EOL                         { () } 

expr :
  ID                               { () }
| NUM                              { () }
| OP                               { () }
| FUN ID ARROW expr                { () }
| expr expr                        { () }
| LPAREN expr COMMA expr RPAREN    { () }
| LET ID EQ expr IN expr           { () }
| LET REC ID EQ expr IN expr       { () }
%% 
