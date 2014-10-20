%{ 

#include "compilador.tab.h" 


void toCadena()
{
yylval.cadena = malloc(sizeof(char)* yyleng);
strcpy(yylval.cadena, yytext);
}

void toSimbol()
{
yylval.simbolo = yyleng;
}

%} 

%option noyywrap 
%option yylineno 

letra [a-zA-Z] 
digito [0-9] 
binario "True"|"False"
ignora " "|\t|\n 
operarit *|+|-|/ 
operlog &|$ 
main "main"
while "while"
endwhile "endwhile"
if "if"
endif "endif"
then "then"
else "else"
endelse "endelse"
void "void"
int "int"
string "string"
as "as"
real "real"
boolean "boolean"
retorno "retorno"

%% 

{ignora}+ {;} 
{main} {toCadena(); return MAIN;}
{while} {toCadena(); return WHILE;}
{endwhile} {toCadena(); return ENDWHILE;}
{if} {toCadena(); return IF;}
{endif} {toCadena(); return ENDIF;}
{else} {toCadena(); return ELSE;}
{endelse} {toCadena(); return ENDELSE;}
{then} {toCadena(); return THEN;}
{as} {toCadena(); return AS;}
{void} {toCadena(); return VOID;}
{int} {toCadena(); return ENTERO;}
{real} {toCadena(); return REAL;}
{string} {toCadena(); return STRING;}
{boolean} {toCadena(); return BOOLEAN;}
{binario} {toCadena(); return BOOLEANO;} 
{retorno} {toCadena(); return RETORNO;} 
{letra}({letra}|{digito})* {toCadena(); return IDENTIFICADOR;} 
["]{letra}*["] {toCadena(); return CADENA;} 
{digito}+ {yylval.numero= atoi(yytext); return NUM_ENTERO;} 
{digito}+"."{digito}+ {yylval.real= atof(yytext); return NUM_REAL;} 
":=" {toCadena(); return ASIGNADOR;} 
";" {toSimbol(); return PUNTO_COMA;} 
"!=" {toCadena(); return DIFERENCIA;} 
"," {toSimbol(); return COMA;} 
"==" {toCadena(); return IGUAL;} 
"." {toSimbol(); return PUNTO;} 
">=" {toCadena(); return MAYOR_IGUAL;} 
"<=" {toCadena(); return MENOR_IGUAL;} 
"(" {toSimbol(); return ABRIR_PARENTESIS;} 
")" {toSimbol(); return CERRAR_PARENTESIS;} 
">" {toSimbol(); return MAYOR;} 
"<" {toSimbol(); return MENOR;} 
"{" {toSimbol(); return ABRIR_LLAVE;} 
"}" {toSimbol(); return CERRAR_LLAVE;} 
"+" {toSimbol(); return SUMA;} 
"-" {toSimbol(); return RESTA;} 
"*" {toSimbol(); return MULTIPLICACION;} 
"/" {toSimbol(); return DIVISION;} 
"^" {toSimbol(); return AND;} 
"|" {toSimbol(); return OR;} 
. {printf("ERROR LEXICO EN LINEA %d \n",yylineno);} 

%% 
