%{
 #include <stdio.h>
 #include <stdlib.h>
 void yyerror(const char *msg);
 void yyerror2(const char *msg);
 extern int curr_line;
 extern int curr_pos;
 FILE * yyin;
 extern int yyleng;
%}

%union{
    int ival;
    char* idval; 
}

%error-verbose
%start prog_start

%token <idval> IDENT VAR 

%token <ival> NUMBER INTEGER

%type <idval> comp declaration declaration2 declaration3 Term Term1 Var Var1 VarList VarDec statement statement1 IfDec prog_start block block2  BoolExp BoolExp1 RelationAndExp RelationAndExp1 RelationExp RelationExp1 Expression Expression1 MultiplicativeExp MultiplicativeExp1  error number begin_program end_program comma colon break continue exit if while do read write then end_if else  else_if end_loop begin_loop and or not true false assign question program array of plus minus mult div mod l_paren r_paren l_square r_square semicolon integer

%left PROGRAM BEGIN_PROGRAM END_PROGRAM INTEGER ARRAY OF IF THEN END_IF ELSE ELSE_IF DO WHILE BEGIN_LOOP READ WRITE AND OR NOT TRUE FALSE EQ NEQ LT GT LTE GTE QUESTION SEMICOLON COLON COMMA PLUS MINUS MULT DIV MOD L_PAREN R_PAREN L_SQUARE R_SQUARE ASSIGN CONTINUE BREAK EXIT END_LOOP

%nonassoc UMINUS


%% 

prog_start:         program ident semicolon block end_program {
				        printf("Start -> program ident semicolon Block end_program \n");
				    }
				    | error 
			        ;
					
program:            PROGRAM {
				        printf("program -> PROGRAM  \n");
				    }
				    | error 
			        ;
			        
ident:              IDENT {
				        printf("ident -> IDENT (%s) \n", $1);
				    }
			        ;

plus:              	PLUS {
				        printf("plus -> PLUS \n");
				    }
			        ;

mult:              	MULT {
				        printf("mult -> MULT \n");
				    }
			        ;

div:              	DIV {
				        printf("div -> DIV \n");
				    }
			        ;

mod:              	MOD {
				        printf("mod -> MOD \n");
				    }
			        ;

minus:              MINUS {
				        printf("minus -> MINUS \n");
				    }
			        ;

l_paren:			L_PAREN {
						printf("l_paren -> L_PAREN \n");
					}
					;

r_paren:			R_PAREN {
						printf("r_paren -> R_PAREN \n");
					}	
					;

l_square:			L_SQUARE {
						printf("l_square -> L_SQUARE \n");
					}	
					;

r_square:			R_SQUARE {
						printf("r_square -> R_SQUARE \n");
					}	
					;

array:              ARRAY {
				        printf("array -> ARRAY \n");
				    }
			        ;

semicolon:          SEMICOLON {
				        printf("semicolon -> SEMICONLON \n");
				    }
				    | error
			        ;

colon:              COLON {
				        printf("colon -> CONLON \n");
				    }
			        | error
			        ;
			        
comma:              COMMA {
				        printf("comma -> COMMA \n");
				    }
			        ;

true:               TRUE {
				        printf("true -> TRUE \n");
				    }
			        ;

false:              FALSE {
				        printf("false -> FALSE \n");
				    }
			        ;
			      
		        
break:              BREAK {
                        printf("break -> BREAK \n");
                    }
			        ;
                    
continue:           CONTINUE {
                        printf("continue -> CONTINUE \n");
                    }
			        ;

question:           QUESTION {
                        printf("question -> QUESTION \n");
                    }
			        ;
                    
exit:               EXIT {
                        printf("exit -> EXIT \n");
                    }
			        ;

if:                 IF {
                        printf("if -> IF \n");
                    }
			        ;

of:                 OF {
                        printf("of -> OF \n");
                    }
			        ;
			        
while:              WHILE {
                        printf("while -> WHILE \n");
                    }
			        ;			    

do:                 DO {
                        printf("do -> DO \n");
                    }
			        ;
			        
read:               READ {
                        printf("read -> READ \n");
                    }
			        ;			    

write:              WRITE {
                        printf("write -> WRITE \n");
                    }
			        ;

then:               THEN {
                        printf("then -> THEN \n");
                    }
			        ;

end_if:             END_IF {
                        printf("end_if -> END_IF \n");
                    }
			        ;

assign:             ASSIGN {
                        printf("assign -> ASSIGN \n");
                    }
			        ;

else:               ELSE {
                        printf("else -> ELSE \n");
                    }
			        ;
			        
else_if:            ELSE_IF {
                        printf("else_if -> ELSE_IF \n");
                    }
			        ;

begin_loop:         BEGIN_LOOP {
                        printf("begin_loop -> BEGIN_LOOP \n");
                    }
			        ;

end_loop:           END_LOOP {
                        printf("end_loop -> END_LOOP \n");
                    }
			        ;

and:                AND {
                        printf("and -> AND \n");
                    }
			        ;

or:                 OR {
                        printf("or -> OR \n");
                    }
			        ;

not:                NOT {
                        printf("not -> NOT \n");
                    }
			        ;
	        	
end_program:        END_PROGRAM {
                        printf("end_program -> END_PROGRAM \n");
                    }
                    | error	
                    ;			

begin_program:      BEGIN_PROGRAM {
                        printf("begin_program -> begin_PROGRAM \n");
                    }
                    | error
                    ;

number:             NUMBER {
				        printf("number -> NUMBER (%d) \n", $1);
				    }
				    | error
			        ;

integer:             INTEGER {
				        printf("integer -> integer (%d) \n", $1);
				    }
				    | error
			        ;

block:              declaration semicolon block2 {
                        printf("block -> declaration semicolon block2 \n");
                    }
			        ;

						
block2:        	    declaration semicolon block2 {
                        printf("block2 -> declaration semicolon block2 \n");
                    }
        			| begin_program statement semicolon statement1 {
        			    printf("block2 -> begin_program statement semicolon statement1 \n");
        			}
        			;
					
						
declaration:        ident declaration2 {
                        printf("declaration -> ident DeclarationDec \n");
                    }
                    ;
						
declaration2:       comma ident declaration2  {
                        printf("declaration2 -> comma ident declaration2 \n");
                    }
                    | colon declaration3 {
                        printf("declaration2 -> colon declaration3 \n");
                    }
                    ;
						
declaration3:       integer {
                        printf("declaration3 -> integer \n");
                    }
                    | array l_square number r_square of integer {
                        printf("declaration3 -> array l_square number r_square of integer \n");
                    }
            		;
						
statement:          Var assign VarDec {
                        printf("statement -> Var assign VarDec \n");
                    }
                    | if BoolExp then statement semicolon statement1 IfDec end_if {
                        printf("statement -> if BoolExp then statement semicolon statement1 IfDec1 IfDec end_if\n");
                    }
                    | while BoolExp begin_loop statement semicolon statement1 end_loop {
                        printf("statement -> while BoolExp begin_loop statement semicolon statement1 end_loop \n");
                    }
                    | do begin_loop statement semicolon statement1 end_loop while BoolExp {
                        printf("statement -> do begin_loop statement semicolon statement1 end_loop while BoolExp \n");
                    }
                    | read Var VarList {
                        printf("statement -> read Var VarList \n");
                    }
                    | write Var VarList {
                        printf("statement -> write Var VarList \n");
                    }
                    | break {
                        printf("statement -> break \n");
                    }
                    | continue {
                        printf("statement -> continue \n");
                    }
                    | exit {
                        printf("statement -> exit \n");
                    } 
        			;
						
VarList:            comma Var VarList {
                        printf("VarList -> comma Var VarList \n");}
                    | {
                        printf("VarList -> \n");
                    }
			        ;
						
BoolExp:            RelationAndExp BoolExp1 {
                        printf("BoolExp -> RelationAndExp BoolExp1 \n");
                    }
        			;
						
BoolExp1:		    or RelationAndExp BoolExp1 {
                        printf("BoolExp1 -> or RelationAndExp BoolExp1 \n");
                    }
                    | {
                        printf("BoolExp1 -> \n");
                    }
			        ;
						
RelationAndExp:     RelationExp RelationAndExp1 {
                        printf("RelationAndExp -> RelationExp RelationAndExp1 \n");
                    }
        			;
						
RelationAndExp1:	and RelationExp RelationAndExp1 {
                        printf("RelationAndExp1 -> and RelationExp RelationAndExp1 \n");
                    }
                    | {
                        printf("RelationAndExp1 -> \n");
                    }
			        ;
						
RelationExp:        not RelationExp1 {
                        printf("RelationExp -> not RelationExp \n");
                    }
			        | RelationExp1 {
				        printf("RelationExp -> RelationExp1 ");
				    }
			        ;
						
RelationExp1:	    Expression comp Expression {
				        printf("RelationExp1 -> Expression comp Expression \n");
                    }
                    | true {
				        printf("RelationExp1 -> true \n");
                    }
                    | false {
			    	    printf("RelationExp1 -> true \n");
                    }
                    | l_paren BoolExp r_paren {
				        printf("RelationExp1 -> l_paren BoolExp r_paren  \n");
			        }
			        ;
						                        
comp:               EQ {
				        printf("comp -> EQ \n");
				    }
                    | NEQ { 
				        printf("comp -> NEQ \n");
				    }
                    | LT {
				        printf("comp -> LT \n");
				    }
                    | GT {
				        printf("comp -> GT \n");
				    }
                    | LTE {
				        printf("comp -> LTE \n");
				    }
                    | GTE {
				        printf("comp -> GTE \n");
				    }
			        ;
						                                                
Expression:         MultiplicativeExp Expression1 {
                        printf("Expression -> MultiplicativeExp Expression1 \n");
			        }
			        ;
						
Expression1:		plus MultiplicativeExp Expression1 {
                        printf("Expression1 -> plus MultiplicativeExp Expression1  \n");}
                    | minus MultiplicativeExp Expression1 {
                        printf("Expression1 -> minus MultiplicativeExp Expression1  \n");}
                    | {
                        printf("Expression1 -> \n");
                    }
			        ;
						
MultiplicativeExp:  Term MultiplicativeExp1 {
                        printf("MultiplicativeExp -> Term MultiplicativeExp1  \n");
			        }
			        ;
						
MultiplicativeExp1:	div Term MultiplicativeExp1 {
                        printf("MultiplicativeExp1 -> div Term MultiplicativeExp1  \n");
                    }
                    | mult Term MultiplicativeExp1 {
                        printf("MultiplicativeExp1 -> mult Term MultiplicativeExp1  \n");
                    }
                    | mod Term MultiplicativeExp1 {
                        printf("MultiplicativeExp1 -> mod Term MultiplicativeExp1 \n");
                    }
                    | {
                        printf("MultiplicativeExp1 -> \n");
			        }
			        ;
						
Term:               minus Term1 {
                        printf("Term -> minus Term1 \n");
                    }
			        | Term1 {
			            printf("Term -> Term1 \n");
			        }
			        ;
						
Term1:			    Var {
				        printf("Term1 -> Var\n");
                    }
                    | number {
				        printf("Term1 -> number \n");
				    }
                    | l_paren Expression r_paren {
				        printf("Term1 -> l_paren Expression r_paren \n");
				    }
			        ;
						
Var:                ident Var1 {
                        printf("Var -> ident Var1 \n");
                    }
                    ;
                        
Var1:               l_square Expression r_square {
                        printf("Var1 -> l_square Expression r_square \n");
                    }
        			| {
        			    printf("Var1 -> \n");
				    }
				    ;
						
VarDec:             Expression {
                        printf("VarDec -> Expression \n");
                    }
                    | BoolExp question Expression colon Expression {
                        printf("VarDec -> BoolExp question Expression colon Expression \n");
                    }
        			;
						
IfDec:			    else_if BoolExp statement semicolon statement1 IfDec {
                        printf("IfDec -> else_if BoolExp statement semicolon statement1 IfDec \n");
                    }
                    | else statement semicolon statement1  {
				        printf("IfDec -> else statement semicolon statement1  \n");
				    }
				    | {
                        printf("IfDec -> \n");
                    }  
			        ;
						
statement1:         statement semicolon statement1  {
                    printf("statement1 -> statement semicolon statement1 \n");
                    }
                    | {
                        printf("statement1 -> \n");
                    }
			        ;	
						
%%

int main(int argc, char **argv) {
	if (argc > 1) {
      	yyin = fopen(argv[1], "r");
      	if (yyin == NULL){
         	printf("syntax: %s filename\n", argv[0]);
      	}
   }
   yyparse();
   return 0;
}

void yyerror(const char *msg) {
   printf("** Line %d, position %d: %s\n", curr_line, curr_pos - yyleng, msg);
}
