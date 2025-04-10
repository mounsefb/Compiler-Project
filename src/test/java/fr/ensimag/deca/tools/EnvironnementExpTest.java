package fr.ensimag.deca.tools;


import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.ExpDefinition;
import fr.ensimag.deca.context.IntType;
import fr.ensimag.deca.context.VariableDefinition;
import fr.ensimag.deca.context.EnvironmentExp.DoubleDefException;
import fr.ensimag.deca.tools.SymbolTable.Symbol;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

/**
 * Example JUnit class. A JUnit class must be named TestXXX or YYYTest. JUnit
 * will run each methods annotated with @Test.
 */
public class EnvironnementExpTest {
    @Test
    public void testEnvironnementExp() {
        try{

            SymbolTable t = new SymbolTable();
            Symbol s1 = t.create("x");
            EnvironmentExp envExp = new EnvironmentExp(null);
            VariableDefinition def = new VariableDefinition(new IntType(s1),null);


            envExp.declare(s1, def);
            // Check that two objects are equal (using Object.equals())
            assertNotNull(envExp.get(s1));
            envExp.declare(s1, def);
            assert(false);


        } catch(DoubleDefException e) {
            
        }
    }

}
