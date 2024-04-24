%{
#include "y.tab.h"
%}

numero       [0-9]+\.?|[0-9]*\.[0-9]+
%%

[ ]
{numero}+    	{ yylval = sscanf(yytext, "%lf", &yylval);
                  return NUMERO; }
\n|.		{ return yytext[0]; }


%%
