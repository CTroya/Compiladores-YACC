%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
%}

%token NUMBER

%%
/* Grammar rules */
E   : E '+' E
    | E '-' E
    | E '*' E
    | E '/' E
    | '-' E 
    | NUMBER
    ;

%%
int main(int argc, char **argv) {
    while (1) {
        yyparse();
    }
    return 0;
}


void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int yywrap(void) {
    return 1;
}
