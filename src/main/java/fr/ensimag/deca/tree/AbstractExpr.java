package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.DecacInternalError;
import fr.ensimag.deca.tools.IndentPrintStream;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;

/**
 * Expression, i.e. anything that has a value.
 *
 * @author gl01
 * @date 01/01/2024
 */
public abstract class AbstractExpr extends AbstractInst {
    /**
     * @return true if the expression does not correspond to any concrete token
     * in the source code (and should be decompiled to the empty string).
     */
    boolean isImplicit() {
        return false;
    }

    /**
     * Get the type decoration associated to this expression (i.e. the type computed by contextual verification).
     */
    public Type getType() {
        return type;
    }

    protected void setType(Type type) {
        Validate.notNull(type);
        this.type = type;
    }
    private Type type;

    @Override
    protected void checkDecoration() {
        if (getType() == null) {
            throw new DecacInternalError("Expression " + decompile() + " has no Type decoration");
        }
    }

    /**
     * Verify the expression for contextual error.
     * 
     * implements non-terminals "expr" and "lvalue" 
     *    of [SyntaxeContextuelle] in pass 3
     *
     * @param compiler  (contains the "env_types" attribute)
     * @param localEnv
     *            Environment in which the expression should be checked
     *            (corresponds to the "env_exp" attribute)
     * @param currentClass
     *            Definition of the class containing the expression
     *            (corresponds to the "class" attribute)
     *             is null in the main bloc.
     * @return the Type of the expression
     *            (corresponds to the "type" attribute)
     */
    public abstract Type verifyExpr(DecacCompiler compiler,
            EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError;

    /**
     * Verify the expression in right hand-side of (implicit) assignments 
     * 
     * implements non-terminal "rvalue" of [SyntaxeContextuelle] in pass 3
     *
     * @param compiler  contains the "env_types" attribute
     * @param localEnv corresponds to the "env_exp" attribute
     * @param currentClass corresponds to the "class" attribute
     * @param expectedType corresponds to the "type1" attribute            
     * @return this with an additional ConvFloat if needed...
     */
    public AbstractExpr verifyRValue(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass, Type expectedType) throws ContextualError { 

        //On verifie l'expression pour recuperer son type
        Type exprType = this.verifyExpr(compiler, localEnv, currentClass);


        //On compare avec le type que l'on attentd
        //Si le type n'est pas assign_compatible on laive une exception contextuelle
        if(!compiler.environmentType.assignCompatible(expectedType, exprType))throw new ContextualError("Incompatibilité de type lors de l'assignation. Type attendu : " + expectedType + ", Type obtenu : " + exprType, getLocation());

        //Si on est dans le cas Float f = (int) il faut transformer le (int) en ConvFloat
        if(exprType.isInt() && expectedType.isFloat()){
            ConvFloat newExprConvFloat = new ConvFloat(this);
            newExprConvFloat.verifyExpr(compiler, localEnv, currentClass);
            return newExprConvFloat;
        }

        //Sinon Le type est bon car c'est soit le meme type soit un subType 
        return this;
    }
    


    // added
    public void codeGenMethodCall(DecacCompiler compiler) {
        throw new UnsupportedOperationException("You can't call a method on an  Abstract Expression !!");

    }


    
    
    @Override
    /**
     * @author boutaley
     * @param compiler
     * @param localEnv
     * @param currentClass
     * @param returnType
     */
    protected void verifyInst(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass, Type returnType)
            throws ContextualError {
        
        setType(verifyExpr(compiler, localEnv, currentClass));

    }

    /**
     * Verify the expression as a condition, i.e. check that the type is
     * boolean.
     *
     * @param localEnv
     *            Environment in which the condition should be checked.
     * @param currentClass
     *            Definition of the class containing the expression, or null in
     *            the main program.
     */
    void verifyCondition(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {

                Type t = verifyExpr(compiler, localEnv, currentClass);
                
                if(!t.isBoolean())throw new ContextualError("IncompatibleTypesException: Expected boolean type. ", getLocation());

                setType(t);
    }

    /**
     * Generate code to print the expression
     *
     * @param compiler
     */
    protected void codeGenPrint(DecacCompiler compiler) {
        throw new UnsupportedOperationException("not yet implemented");
    }

    protected void codeGenPrintX(DecacCompiler compiler) { //adnane
        throw new UnsupportedOperationException("not yet implemented");
    }

    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        throw new UnsupportedOperationException("not yet implemented");
    }
    

    @Override
    protected void decompileInst(IndentPrintStream s) {
        decompile(s);
        s.print(";");
    }

    @Override
    protected void prettyPrintType(PrintStream s, String prefix) {
        Type t = getType();
        if (t != null) {
            s.print(prefix);
            s.print("type: ");
            s.print(t);
            s.println();
        }
    }
}
