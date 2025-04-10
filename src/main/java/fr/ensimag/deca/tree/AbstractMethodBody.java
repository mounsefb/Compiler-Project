package fr.ensimag.deca.tree;
import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;



public abstract class AbstractMethodBody extends Tree{
    
    /**
     * 
     * @param compiler
     * @param localEnv the environemment of the class 
     * @param paramEnv  the environnement of the param
     * @param currentClass
     * @param rType The type that must be returned in the method
     * @throws ContextualError
     */
    protected abstract void verifyMethodBody(DecacCompiler compiler,
    EnvironmentExp localEnv, EnvironmentExp paramEnv, ClassDefinition currentClass, Type rType)
    throws ContextualError;


    protected abstract void codeGenMethodBody(DecacCompiler compiler);
    
}