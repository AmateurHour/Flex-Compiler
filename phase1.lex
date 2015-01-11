
%{   
   int curr_line = 1, curr_pos = 1;
   int num_ops = 0;
   int num_eqs = 0;
   int num_parens = 0;
   int num_ints = 0;
   int num_keys = 0;
   int num_ids = 0;
%}

DIGIT    [0-9]

UC   [A-Z]

LC   [a-z]
   
%%
"-"            {printf("SUB\n"); curr_pos += yyleng; num_ops++;}
"+"            {printf("ADD\n"); curr_pos += yyleng; num_ops++;}
"*"            {printf("MULT\n"); curr_pos += yyleng; num_ops++;}
"/"            {printf("DIV\n"); curr_pos += yyleng; num_ops++;}
"%"            {printf("MOD\n"); curr_pos += yyleng; num_ops++;}
"="            {printf("EQUAL\n"); curr_pos += yyleng; num_eqs++;}

":="           {printf("ASSIGN\n"); curr_pos += yyleng; num_ops++;}

"=="           {printf("EQ\n"); curr_pos += yyleng; num_ops++;}
"<>"           {printf("NEQ\n"); curr_pos += yyleng; num_ops++;}
"<"            {printf("LT\n"); curr_pos += yyleng; num_ops++;}
">"            {printf("GT\n"); curr_pos += yyleng; num_ops++;}
"<="           {printf("LTE\n"); curr_pos += yyleng; num_ops++;}
">="           {printf("GTE\n"); curr_pos += yyleng; num_ops++;}

";"            {printf("SEMICOLON\n"); curr_pos += yyleng; num_ops++;}
":"            {printf("COLON\n"); curr_pos += yyleng; num_ops++;}
","            {printf("COMMA\n"); curr_pos += yyleng; num_ops++;}
"?"            {printf("QUESTION\n"); curr_pos += yyleng; num_ops++;}

"("            {printf("L_PAREN\n"); curr_pos += yyleng; num_parens++;}
")"            {printf("R_PAREN\n"); curr_pos += yyleng; num_parens++;}
"["            {printf("L_BRACKET\n"); curr_pos += yyleng; num_ops++;}
"]"            {printf("R_BRACKET\n"); curr_pos += yyleng; num_ops++;}


"beginprogram" {printf("BEGIN_PROGRAM\n"); curr_pos += yyleng; num_keys++;}
"program"      {printf("PROGRAM\n"); curr_pos += yyleng; num_keys++;}
"endprogram"   {printf("END_PROGRAM\n"); curr_pos += yyleng; num_keys++;}

"integer"      {printf("INTEGER\n"); curr_pos += yyleng; num_keys++;}
"array"        {printf("ARRAY\n"); curr_pos += yyleng; num_keys++;}
"of"           {printf("OF\n"); curr_pos += yyleng; num_keys++;}

"if"           {printf("IF\n"); curr_pos += yyleng; num_keys++;}
"then"         {printf("THEN\n"); curr_pos += yyleng; num_keys++;}
"endif"        {printf("ENDIF\n"); curr_pos += yyleng; num_keys++;}
"else"         {printf("ELSE\n"); curr_pos += yyleng; num_keys++;}
"elseif"       {printf("ELSEIF\n"); curr_pos += yyleng; num_keys++;}

"while"        {printf("WHILE\n"); curr_pos += yyleng; num_keys++;}
"do"           {printf("DO\n"); curr_pos += yyleng; num_keys++;}
"beginloop"    {printf("BEGINLOOP\n"); curr_pos += yyleng; num_keys++;}
"endloop"      {printf("ENDLOOP\n"); curr_pos += yyleng; num_keys++;}

"break"        {printf("BREAK\n"); curr_pos += yyleng; num_keys++;}
"continue"     {printf("CONTINUE\n"); curr_pos += yyleng; num_keys++;}
"exit"          {printf("EXIT\n"); curr_pos += yyleng; num_keys++;}

"read"         {printf("READ\n"); curr_pos += yyleng; num_keys++;}
"write"        {printf("WRITE\n"); curr_pos += yyleng; num_keys++;}

"and"          {printf("AND\n"); curr_pos += yyleng; num_keys++;}
"or"           {printf("OR\n"); curr_pos += yyleng; num_keys++;}
"not"           {printf("NOT\n"); curr_pos += yyleng; num_keys++;}

"true"         {printf("TRUE\n"); curr_pos += yyleng; num_keys++;}
"false"        {printf("FALSE\n"); curr_pos += yyleng; num_keys++;}




{DIGIT}+       {printf("NUMBER %s\n", yytext); curr_pos += yyleng; num_ints++;}

(({UC}|{LC})+((\_|{UC}|{LC}|{DIGIT})*({UC}|{LC}|{DIGIT})+)*) {curr_pos += yyleng; printf("IDENT %s\n", yytext); num_ids++;}

" "            {curr_pos += yyleng;}

("##"(.)*\n)   {curr_line++; curr_pos = 1;}

[ \t]+         {/* ignore spaces */ curr_pos += yyleng;}

"\n"           {curr_line++; curr_pos = 1;}

"^"              {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", curr_line, curr_pos, yytext); exit(0);}

%%

int main(int argc, char ** argv)
{
    if(argc >= 2)
    {
        yyin = fopen(argv[1], "r");
        if(!yyin)
        {
            yyin = stdin;    
        }
    }
    else
    {
        yyin = stdin;
    }    
    
   yylex();
}

