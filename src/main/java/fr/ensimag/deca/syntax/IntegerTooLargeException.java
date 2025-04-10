package fr.ensimag.deca.syntax;

import org.antlr.v4.runtime.Token;

/**
 * Exception raised when using a huge number that could not fit in 32bits
 * 
 * @author boutaley
 * @date 13/01/2024
 */
public class IntegerTooLargeException   extends DecaRecognitionException {
    
    private static final long serialVersionUID = 1L;

    public IntegerTooLargeException (DecaParser recognizer, Token offendingToken){
        super(recognizer, offendingToken);
    }

    @Override
    public String getMessage() {
        return  "InvalidValueException: Integer too large ";
    }
}
