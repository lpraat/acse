%{
    #include <math.h>
    #include <stdio.h>
    int yylex (void);
    int yyerror ();
%}

%union {
    double value;
}

%token NEWLINE
%token NUM
%token LPAR
%token RPAR
%left OP_PLUS OP_MINUS
%left OP_MUL OP_DIV
%right NEG
%right OP_EXP

%type <value> NUM
%type <value> expr

%%

input: %empty
     | input line
     ;

line: NEWLINE           {}
    | expr NEWLINE      { printf("Result: %f", $1); }
    ;

expr: NUM                       { $$ = $1; }
    | expr OP_PLUS expr         { $$ = $1 + $3; }
    | expr OP_MINUS expr        { $$ = $1 - $3; }
    | OP_MINUS expr %prec NEG   { $$ = -$2; }
    | expr OP_MUL expr          { $$ = $1 * $3; }
    | expr OP_DIV expr          { $$ = $1 / $3; }
    | expr OP_EXP expr          { $$ = pow($1, $3); }
    | LPAR expr RPAR            { $$ = $2; }
    ;

%%

int yyerror(char* s) {
    printf("%s\n", s);
}

int main() {
    yyparse();
}
