%{
#include "y.tab.h"
%}

digit       [0-9]
%%
{digit}+    {
                yylval = atoi(yytext);
                return DIGITO;
            }

"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"%"         { return '%'; }
"("         { return '('; }
")"         { return ')'; }
"\n"        { return '\n'; }

[ \t]       { /* Ignore whitespace */ }

.           { printf("Unexpected character: %s\n", yytext); }

%%
