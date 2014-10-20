#include <stdlib.h>
#include <stdio.h>
typedef struct nulo
{
struct nulo * sig;
char identificador [20];
char tipo[20];
int valorInt;
double valorDouble;
char * cadena;
} simbolo;

simbolo * crear()
{
return NULL;
}

void insertar(simbolo **p_t,simbolo * s)
{
s->sig = (*p_t);
(*p_t) = s;
}

simbolo * buscar(simbolo * t,char identificador[20])
{
while ( (t != NULL) && (strcmp(identificador, t->identificador)) )
t = t->sig;
return (t);
}
