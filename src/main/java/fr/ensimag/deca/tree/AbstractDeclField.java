package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;

/**
 * Field declaration
 *
 * @author gl01
 * @date 01/01/2024
 */
public abstract class AbstractDeclField extends Tree {
    

    protected abstract void verifyDeclFieldDeuxiemePasse(DecacCompiler compiler,
            EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError;

    protected abstract void verifyDeclFieldTroisiemePasse(DecacCompiler compiler, 
            EnvironmentExp localEnv, ClassDefinition currentClass) 
            throws ContextualError;



    protected abstract void codeGenDeclField(DecacCompiler compiler);

}
