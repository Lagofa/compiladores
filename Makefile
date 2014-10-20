todo: 
	flex compilador.l
	bison -d compilador.y
	gcc -o compilador compilador.tab.c lex.yy.c