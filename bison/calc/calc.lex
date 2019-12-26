%{
    #define YYSTYPE double
    #include "calc.tab.h"
    #include <stdlib.h>
%}

%option noyywrap

DIGIT [0-9]
LETTER [a-zA-Z]

%%
" " {

}

{LETTER}+ {

}

"\n" {
    return NEWLINE;
}


"+" {
    return OP_PLUS;
}

"-" {
    return OP_MINUS;
}

"*" {
    return OP_MUL;
}

{DIGIT}*"."{DIGIT}+ |
{DIGIT}+ {
    yylval = atof(yytext);
    return NUM;
}

%%