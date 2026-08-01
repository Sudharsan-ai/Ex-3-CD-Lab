%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

int valid = 1;
%}

%token NUMBER ID

%%

statement:
        expr
        {
            if(valid)
                printf("\nValid Arithmetic Expression\n");
        }
        ;

expr:
        expr '+' term
      | expr '-' term
      | term
      ;

term:
        term '*' factor
      | term '/' factor
      | factor
      ;

factor:
        '(' expr ')'
      | NUMBER
      | ID
      ;

%%

int main()
{
    printf("Enter Expression:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    valid = 0;
    printf("\nInvalid Arithmetic Expression\n");
}