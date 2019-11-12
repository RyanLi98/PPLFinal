/*** Definition section ***/
%{
//parser.h is the name of file
#include parser.h
/* C code to be copied verbatim */
%}

/* regex variable assignment */
digit [0-9]{1}
integer [0-9]+
id [a-zA-Z]+([a-zA-Z0-9])*
letter [a-zA-Z]{1}
float [0-9]+\.[0-9]+
DELIMITER [;|.|,|=|(|)|[|:|\]]{1}
whitespace [\t|\ |\n|]{1}
operators ([+*/<>=!-]?[!=]){1}


/* This tells flex to read only one input file */
%option noyywrap

%%

 /*** Rules section ***/
/* keyword */
mainprog	{return MAINPROG;}
function	{return FUNCTION;}
procedure	{return PROCEDURE;}
begin	{return BEGIN;}
end	{return END;}
if	{return IF;}
then	{return THEN;}
else	{return ELSE;}
nop	{return NOP;}
while	{return WHILE;}
return	{return RETURN;}
print	{return PRINT;}
in	{return IN;}

{digit} {
	yylval.ival = atoi(yytext); 
  return DIGIT;
  }

{integer} {
	yylval.ival = atoi(yytext); 
  return INTEGER;
}

{float} {
	yylval.fval = atof(yytext);
  return FLOAT;
}

{id} {
	yylval.str = strdup(yytext);
  return ID;
}

{letter} {
	yylval.str = strdup(yytext);
  return LETTER;
}

/* operator */
"+"	{return PLUS;}
"-"	{return MINUS;}
"*"	{return MULTIPLY;}
"/"	{return DIVIDE;}
"<"	{return LESS;}
">"	{return GREATER;}
"<=" {return LEQ;}
">=" {return GEQ;}
"=="	{return EQUAL;}
"!="	{return NOTEQ;}
"!"	{return NOT;}

/* delimiter */
;	{return SEMICOLON;}
.	{return DOT;}
,	{return COMMA;}
=	{return ASSIGNMENT'}
(	{return LEFTP;}
)	{return RIGHTP;}
[	{return RIGHTB;}
]	{return LEFTB;}
:	{return COLON;}
{whitespace} /* do nothing */ 
%%
/*** C Code section ***/
