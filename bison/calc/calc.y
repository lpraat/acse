%{
    #define YYSTYPE double
    #include <math.h>
    #include <stdio.h>
    int yylex (void);
    int yyerror ();
%}

%token NEWLINE
%token NUM
%token OP_PLUS
%token OP_MINUS
%token OP_MUL

%%

input: %empty
     | input line
     ;

line: NEWLINE           {}
    | expr NEWLINE      { printf("Result: %f", $1); }
    ;

expr: NUM                 { $$ = $1; }
    | expr expr OP_PLUS   { $$ = $1 + $2; }
    | expr expr OP_MINUS  { $$ = $1 - $2; }
    | expr expr OP_MUL    { $$ = $1 * $2; }
    ;

%%

int yyerror(char* s) {
    printf("%s\n", s);
}

int main() {
    yyparse();
}
