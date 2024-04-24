
1. Ejecutar `yacc calculator.y` para generar `y.tab.h` y `y.tab.c`.
2. Ejecutar `flex calculator.l` para generar `lex.yy.c`.
3. Compilar ambos archivos C generados con el comando:
   ```
   gcc y.tab.c lex.yy.c -o calculator
   ```
4. Ejecutar el programa compilado con:
   ```
   ./calculator
   ```
5. Para probar el y.output de la gramática ambigua, ejecutar
   ```
   yacc ./gramAmbigua.y -v
   ```