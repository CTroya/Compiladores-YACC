#!/usr/bin/bash

yacc -vd calculator.y 
lex calculator.l
gcc y.tab.c lex.yy.c -o calculator -w
./calculator
