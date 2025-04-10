package fr.ensimag.deca.tree;
import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;



public abstract class AbstractDeclParam extends Tree{
    
    protected abstract Type verifyDeclParamDeuxiemePasse(DecacCompiler compiler) throws ContextualError;


    protected abstract void verifyDeclParamTroisiemePasse(DecacCompiler compiler, EnvironmentExp envExpP) throws ContextualError;
    protected abstract void codeGenDeclParam(DecacCompiler compiler);

    public abstract Type getType();
    public abstract AbstractIdentifier getName();
    
}