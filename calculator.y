%{
#include <stdio.h>
#include <stdlib.h>
%}

%token DIGITO

%%
linea : expr '\n' { printf("%d\n", $1); }
      ;

expr  : expr '+' term { $$ = $1 + $3; }
      | expr '-' term { $$ = $1 - $3; }
      | term
      ;

term  : term '*' factor { $$ = $1 * $3; }
      | term '/' factor { if ($3 == 0) {
                              yyerror("No hay division por cero kp");
                              $$ = 0; 
                          } else { 
                              $$ = $1 / $3; 
                          }}
      | term '%' factor { if ($3 == 0) {
                              yyerror("No hay resto por cero kp");
                              $$ = 0; 
                          } else { 
                              $$ = $1 % $3; 
                          }}
      | factor
      ;

factor: '(' expr ')' { $$ = $2; }
      | DIGITO
      ;

%%

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int main() {
    printf("Ingrese una expresión: \n");
    do {
        printf("> ");
    } while (yyparse());
    return 0;
}

int yylex(void);
void yywrap() {
}
