%{
    #include "infix_calc.tab.h"
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

"(" {
    return LPAR;
}

")" {
    return RPAR;
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

"/" {
    return OP_DIV;
}

"^" {
    return OP_EXP;
}

{DIGIT}*"."{DIGIT}+ |
{DIGIT}+ {
    yylval.value = atof(yytext);
    return NUM;
}

%%