lexstruc.tab.c lexstruc.tab.h: lexstruc.y
	bison -d lexstruct.y
lex.yy.c: lexstruc.l lexstruct.tab.h
	flex lexstruc.l
lexstruc: lex.yy.c lexstruc.tab.c lexstruc.tab.h
	g++ lexstruc.tab.c lex.yy.c -lfl -o interpreter 
