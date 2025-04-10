package fr.ensimag.deca.syntax;

import org.antlr.v4.runtime.Token;

public class FloatTooSmallException extends DecaRecognitionException{
    
    public FloatTooSmallException (DecaParser recognizer, Token offendingToken){
        super(recognizer, offendingToken);
    }

    @Override
    public String getMessage() {
        return  "InvalidValueException: Float too small ";
    }
    private static final long serialVersionUID = 1L;
}
