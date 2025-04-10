package fr.ensimag.deca.syntax;

import org.antlr.v4.runtime.Token;

public class FloatTooLargeException extends DecaRecognitionException{
        public FloatTooLargeException (DecaParser recognizer, Token offendingToken){
        super(recognizer, offendingToken);
    }

    @Override
    public String getMessage() {
        return  "InvalidValueException: Float too large ";
    }
    private static final long serialVersionUID = 1L;

}
