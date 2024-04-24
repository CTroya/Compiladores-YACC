%{
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE double /* se usa el tipo double para la pila de YACC*/
%}

%token NUMERO
%left '+' '-'
%left '*' '/'
%right MENOSU

%%

lineas 	:  lineas expr '\n' 	{ printf("%g\n>", $2); }
	| lineas '\n'
	| /* cadena vacia */
	| error '\n'		{ yyerror("reintroduzca la ultima linea:");
				  yyerrok; }
	;

expr 	: expr '+' expr 	{ $$ = $1 + $3; }
	| expr '-' expr		{ $$ = $1 - $3; } 
	| expr '*' expr		{ $$ = $1 * $3; }
	| expr '/' expr		{ $$ = $1 / $3; }
	| '(' expr ')'		{ $$ = $2; }
	| '-' expr %prec MENOSU	{ $$ = -$2; }
	| NUMERO	
	;

%%

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int main() {
    printf("Enter an expression: \n>");
    yyparse();
    return 0;
}

int yylex(void);
void yywrap() {
}

