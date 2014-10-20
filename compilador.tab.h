
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     WHILE = 258,
     ENDWHILE = 259,
     IF = 260,
     ENDIF = 261,
     THEN = 262,
     IDENTIFICADOR = 263,
     CADENA = 264,
     BOOLEANO = 265,
     NUM_ENTERO = 266,
     NUM_REAL = 267,
     ASIGNADOR = 268,
     PUNTO_COMA = 269,
     DIFERENCIA = 270,
     COMA = 271,
     IGUAL = 272,
     PUNTO = 273,
     MAYOR_IGUAL = 274,
     MENOR_IGUAL = 275,
     ABRIR_PARENTESIS = 276,
     CERRAR_PARENTESIS = 277,
     MAYOR = 278,
     MENOR = 279,
     ABRIR_LLAVE = 280,
     CERRAR_LLAVE = 281,
     SUMA = 282,
     RESTA = 283,
     MULTIPLICACION = 284,
     DIVISION = 285,
     AND = 286,
     OR = 287,
     MAIN = 288,
     ENTERO = 289,
     AS = 290,
     REAL = 291,
     BOOLEAN = 292,
     STRING = 293,
     RETORNO = 294,
     VOID = 295,
     ELSE = 296,
     ENDELSE = 297
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 11 "compilador.y"

int numero;
double real;
char *cadena;
char simbolo;



/* Line 1676 of yacc.c  */
#line 103 "compilador.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


