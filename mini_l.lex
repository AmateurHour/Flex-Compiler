/*
CS152 Project Phase 1
Jordan Meyer - jmeye006
Christian Cruz - ccruz006
*/
%{   
    #include "y.tab.h"
   int curr_line = 1, curr_pos = 1;
   int num_ops = 0;
   int num_eqs = 0;
   int num_parens = 0;
   int num_ints = 0;
   int num_keys = 0;
   int num_ids = 0;
%}
   
%%
"-"            {curr_pos += yyleng; num_ops++; return MINUS;}
"+"            {curr_pos += yyleng; num_ops++; return PLUS;}
"*"            {curr_pos += yyleng; num_ops++; return MULT;}
"/"            {curr_pos += yyleng; num_ops++; return DIV;}
"%"            {curr_pos += yyleng; num_ops++; return MOD;}

":="           {curr_pos += yyleng; num_ops++; return ASSIGN;}

"=="           {curr_pos += yyleng; num_ops++; return EQ;}
"<>"           {curr_pos += yyleng; num_ops++; return NEQ;}
"<"            {curr_pos += yyleng; num_ops++; return LT;}
">"            {curr_pos += yyleng; num_ops++; return GT;}
"<="           {curr_pos += yyleng; num_ops++; return LTE;}
">="           {curr_pos += yyleng; num_ops++; return GTE;}

";"            {curr_pos += yyleng; num_ops++; return SEMICOLON;}
":"            {curr_pos += yyleng; num_ops++; return COLON;}
","            {curr_pos += yyleng; num_ops++; return COMMA;}
"?"            {curr_pos += yyleng; num_ops++; return QUESTION;}

"("            {curr_pos += yyleng; num_parens++; return L_PAREN;}
")"            {curr_pos += yyleng; num_parens++; return R_PAREN;}
"["            {curr_pos += yyleng; num_ops++; return L_SQUARE;}
"]"            {curr_pos += yyleng; num_ops++; return R_SQUARE;}


"beginprogram" {curr_pos += yyleng; num_keys++; return BEGIN_PROGRAM;}
"program"      {curr_pos += yyleng; num_keys++; return PROGRAM;}
"endprogram"   {curr_pos += yyleng; num_keys++; return END_PROGRAM;}

"integer"      {curr_pos += yyleng; num_keys++; return INTEGER;}
"array"        {curr_pos += yyleng; num_keys++; return ARRAY;}
"of"           {curr_pos += yyleng; num_keys++; return OF;}

"continue"      {curr_pos += yyleng; num_keys++; return CONTINUE;}
"break"        {curr_pos += yyleng; num_keys++; return BREAK;}
"exit"           {curr_pos += yyleng; num_keys++; return EXIT;}

"if"           {curr_pos += yyleng; num_keys++; return IF;}
"then"         {curr_pos += yyleng; num_keys++; return THEN;}
"endif"        {curr_pos += yyleng; num_keys++; return END_IF;}
"else"         {curr_pos += yyleng; num_keys++; return ELSE;}

"do"		   {curr_pos += yyleng; num_keys++; return DO;}
"while"        {curr_pos += yyleng; num_keys++; return WHILE;}
"beginloop"    {curr_pos += yyleng; num_keys++; return BEGIN_LOOP;}
"endloop"      {curr_pos += yyleng; num_keys++; return END_LOOP;}

"read"         {curr_pos += yyleng; num_keys++; return READ;}
"write"        {curr_pos += yyleng; num_keys++; return WRITE;}

"and"          {curr_pos += yyleng; num_keys++; return AND;}
"or"           {curr_pos += yyleng; num_keys++; return OR;}
"not"          {curr_pos += yyleng; num_keys++; return NOT;}

"true"         {curr_pos += yyleng; num_keys++; return TRUE;}
"false"        {curr_pos += yyleng; num_keys++; return FALSE;}

([0-9])+                        {
                                    curr_pos += yyleng; 
                                    num_ints++;
                                    yylval.ival = atoi(yytext); 
                                    return NUMBER;
                                }

[[:alpha:]]([[:alnum:]]|\_)*    {
                                    yylval.idval = yytext;
                                    curr_pos += yyleng;
                                    num_ids++;
                                    return IDENT;
                                }

" "            {curr_pos += yyleng;}

("##"(.)*\n)    {
                    curr_line++; 
                    curr_pos = 1;
                }

[ \t]+          {curr_pos += yyleng;}

\n              {
                    curr_line++; 
                    curr_pos = 1;
                }

.            {printf("Error at Line %d, column %d: unrecognized symbol \"%s\"\n", curr_line, curr_pos, yytext); exit(0);}

%%



