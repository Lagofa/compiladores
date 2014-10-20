%{ 
#include "tipos.c"
simbolo * t;
#include <stdio.h>
extern int yylex(void);
extern int yylineno;
void yyerror ();

%}

%union {
int numero;
double real;
char *cadena;
char simbolo;
}

%start inicio
  
%token WHILE ENDWHILE IF ENDIF THEN IDENTIFICADOR  
%token CADENA BOOLEANO NUM_ENTERO NUM_REAL ASIGNADOR
%token PUNTO_COMA DIFERENCIA COMA IGUAL PUNTO
%token MAYOR_IGUAL MENOR_IGUAL ABRIR_PARENTESIS
%token CERRAR_PARENTESIS MAYOR MENOR ABRIR_LLAVE
%token CERRAR_LLAVE SUMA RESTA MULTIPLICACION
%token DIVISION AND OR MAIN ENTERO AS REAL 
%token BOOLEAN STRING RETORNO VOID  ELSE ENDELSE

%%
 
 
inicio:     main
          | dec_funcion main def_funcion
 
dec_funcion:    prot_funcion {printf("FIN DE DECLARACION DE FUNCIONES\n");}
              | prot_funcion dec_funcion

prot_funcion:     tipo_funcion IDENTIFICADOR ABRIR_PARENTESIS var_prot CERRAR_PARENTESIS PUNTO_COMA

var_prot:      VOID
             | declaracion_var_prot

declaracion_var_prot:    tipo_variable
                       | tipo_variable COMA declaracion_var_prot

def_funcion:    tipo_funcion funcion {printf("FIN DE DEFINICION DE FUNCIONES\n");}
              | tipo_funcion funcion def_funcion 

tipo_funcion:    REAL 
  	       | STRING
	       | ENTERO
	       | BOOLEAN
               | VOID

funcion:   IDENTIFICADOR ABRIR_PARENTESIS var_funcion CERRAR_PARENTESIS ABRIR_LLAVE programa retorno CERRAR_LLAVE
                  
retorno:     
           | RETORNO valor_variable PUNTO_COMA
           | RETORNO IDENTIFICADOR PUNTO_COMA

var_funcion:      VOID    
                | declaracion_var_funcion

declaracion_var_funcion:    declaracion
                          | declaracion COMA declaracion_var_funcion	

main: MAIN ABRIR_PARENTESIS CERRAR_PARENTESIS ABRIR_LLAVE programa CERRAR_LLAVE {printf("FIN DEL MAIN\n");}

programa:          asignacion
	  	 | declaracion PUNTO_COMA
		 | if
		 | while
		 | ejecutar_funcion
                 | operacion_matematica
                 | asignacion programa
           	 | declaracion PUNTO_COMA programa
                 | if programa
		 | while programa
                 | ejecutar_funcion programa
                 | operacion_matematica programa

if:     IF condiciones THEN  programa ENDIF
      | IF condiciones THEN  programa ELSE programa ENDELSE ENDIF

condiciones:     IDENTIFICADOR comparador IDENTIFICADOR
               | IDENTIFICADOR comparador IDENTIFICADOR operador condiciones

comparador:     MAYOR
              | MENOR
              | IGUAL
              | MAYOR_IGUAL
              | MENOR_IGUAL

operador:     OR
            | AND    
         
while: WHILE condiciones THEN programa ENDWHILE

declaracion:   IDENTIFICADOR AS tipo_variable  

tipo_variable:   REAL 
  	       | STRING
               | ENTERO
               | BOOLEAN

asignacion:      IDENTIFICADOR ASIGNADOR valor_variable PUNTO_COMA

valor_variable:    NUM_REAL 
  	         | CADENA
                 | NUM_ENTERO
                 | BOOLEANO 	

ejecutar_funcion:    IDENTIFICADOR ASIGNADOR IDENTIFICADOR ABRIR_PARENTESIS parametros CERRAR_PARENTESIS PUNTO_COMA
                   | IDENTIFICADOR ABRIR_PARENTESIS CERRAR_PARENTESIS PUNTO_COMA

parametros: 
            | variable_parametro


variable_parametro:     valor_variable
                      | IDENTIFICADOR
		      | IDENTIFICADOR COMA variable_parametro
                      | valor_variable COMA variable_parametro

operacion_matematica: IDENTIFICADOR ASIGNADOR operando operador_matematico operando PUNTO_COMA

operando:   valor
          | IDENTIFICADOR

valor:        NUM_REAL 
            | NUM_ENTERO 

operador_matematico:    SUMA
                      | RESTA
                      | MULTIPLICACION
                      | DIVISION

%%
 
void yyerror()
{
printf("ERROR DE SINTAXIS EN LINEA %d\n", yylineno);
}
 
int main()
{
t = crear();
yyparse();
return 0;
}