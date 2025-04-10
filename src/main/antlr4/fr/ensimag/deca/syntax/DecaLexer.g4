lexer grammar DecaLexer;

options {
    language=Java;
    // Indique à ANTLR de faire en sorte que la classe lexer générée
    // étende la classe nommée, qui est l'endroit où tout le code et
    // les variables de support seront placés.
    superClass = AbstractDecaLexer;
}

@members {
    // Déclarations de membres supplémentaires si nécessaires
}

//Ignorer les espaces, les tabulations, les nouvelles lignes et les espaces blancs
WS : ( ' ' | '\t' | '\r' | '\n' ) { skip(); };

/***************** TOKENS *****************/

OBRACE : '{';
CBRACE : '}';
OPARENT : '(';
CPARENT : ')';
SEMI : ';';
COMMA : ',';
EOL : '\n';

/***************** Mots-Cles *****************/

ASM     : 'asm';

//classe et methode
CLASS   : 'class';
EXTENDS : 'extends';
NEW     : 'new';
THIS    : 'this';
RETURN  : 'return';

//Portée
PROTECTED : 'protected';
PUBLIC : 'public' ;


//manip des types dynamqiue
INSTANCEOF: 'instanceof';

//Methode print
PRINTLN : 'println';
PRINT   : 'print';
PRINTLNX : 'printlnx';
PRINTX  : 'printx';

//Methode Read
READFLOAT : 'readFloat';
READINT : 'readInt';

//Condtion
IF      : 'if';
ELSE    : 'else';

//Boucle
WHILE   : 'while';

//null
NULL    : 'null';

//cste bool
TRUE    : 'true';
FALSE   : 'false';



/***************** OPERATEUR *****************/

PLUS : '+';
MINUS : '-';
TIMES : '*';

GT : '>';
LT : '<';
GEQ : '>=';
LEQ : '<=';
EQUALS : '=';
EQEQ : '==';
NEQ : '!=';

AND : '&&';
OR : '||';

EXCLAM : '!';
SLASH : '/';
PERCENT : '%';
DOT : '.';



/***************** IDENTIFICATEUR *****************/

fragment DIGIT : '0'  ..  '9';
fragment LETTER  : ('a' .. 'z' | 'A' .. 'Z');
IDENT : (LETTER | '$' | '_') (LETTER | DIGIT | '$' | '_')*;






/***************** NOMBRES *****************/

// Littéraux entiers
fragment POSITIVE_DIGIT : '1' .. '9';
INT : ('0' | (POSITIVE_DIGIT DIGIT*)); 

//Littéraux flottants
fragment NUM : DIGIT+;
fragment SIGN : ('+' | '-' );
fragment EXP: ('E' | 'e') SIGN? NUM;
fragment DEC : NUM '.' NUM;
fragment FLOATDEC : (DEC | (DEC EXP)) ('F' | 'f')?;
fragment DIGITHEX : '0' .. '9' | 'A' ..  'F' | 'a' .. 'f';
fragment NUMHEX : DIGITHEX+; 
fragment FLOATHEX : ('0x' | '0X') NUMHEX '.' NUMHEX ('P' | 'p') SIGN? NUM ('F' | 'f')?;
FLOAT : FLOATDEC | FLOATHEX;




/***************** LITTÉRAUX ET COMMENTAIRES *****************/

// Commentaires
COMMENTAIRE : '//' (~('\r' | '\n' ))* { skip(); };
COMM_MULTILIGNE : '/*' .*? '*/' { skip(); };

// Chaînes de caractères
//fragment STRING_CAR : ('\\t' |'\\n' | ' ' .. '!' | '#' .. '[' | ']' .. '~' | '\\r' | 'à' .. 'ü' | SEMI)~('\\' | '"');
//fragment STRING_CAR : ~('"' | '\\');
//fragment STRING_CAR : ~('"' | '\\' | '\t' | '\n' | '\r' | ' '..'!' | '#'..'[' | ']'..'~' | 'à'..'ü');
//STRING : '"' (STRING_CAR | '\\"' | '\\\\' )* '"';
//MULTI_LINE_STRING : '"' (STRING_CAR | '\\"' | '\\\\' | EOL | '\t' | '\r')* '"';

// Regles sur les chaines de caracteres
fragment STRING_CAR: ~('"' | '\\' | '\n' );
STRING: '"' (STRING_CAR | '\\"' | '\\\\' | '\n')* '"';
MULTI_LINE_STRING: '"' (STRING_CAR | EOL | '\\"' | '\\\\')* '"';

/***************** FICHIER *****************/
fragment FILENAME : (LETTER | DIGIT | '.' | '-' | '_')+;
INCLUDE : '#include' (' ')* '"' FILENAME '"'{
    doInclude(getText());
    skip();
    
};













