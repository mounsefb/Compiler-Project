package fr.ensimag.deca.tree;
import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;



public abstract class AbstractDeclMethod extends Tree{
    
    protected abstract void verifyListDeclMethodDeuxiemePasse(DecacCompiler compiler,
        EnvironmentExp localEnv, ClassDefinition currentClass)
        throws ContextualError;

    protected abstract void verifyDeclMethodTroisiemePasse(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition classe)
        throws ContextualError;

    protected abstract void codeGenDeclMethod(DecacCompiler compiler);
    public abstract ListDeclParam  getListParam();
    
}