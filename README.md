# Yacc and Flex calculator

An integer calculator built with Yacc and Flex. The repository also has an ambiguous grammar, to show the conflicts that Yacc reports.

Course project for the Compilers course at Universidad Católica (UCA).

## The calculator

The calculator reads one expression per line and prints the result. It supports:

- Addition, subtraction, multiplication, division and modulo (`+ - * / %`).
- Parentheses.
- Operator precedence: `*`, `/` and `%` before `+` and `-`.
- An error message for division by zero and modulo by zero.

## Build and run

```sh
yacc -d calculator.y
flex calculator.l
gcc y.tab.c lex.yy.c -o calculator
./calculator
```

## Ambiguous grammar

`GramAmbigua/gramAmbigua.y` has a grammar with no precedence rules. Run Yacc with `-v` to get the report:

```sh
yacc -v GramAmbigua/gramAmbigua.y
```

Yacc writes the shift/reduce conflicts to `y.output`.

## Stack

C, Yacc, Flex, GCC.
