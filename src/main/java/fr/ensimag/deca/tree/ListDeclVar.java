package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.tools.IndentPrintStream;

/**
 * List of declarations (e.g. int x; float y,z).
 * 
 * @author gl01
 * @date 01/01/2024
 */
public class ListDeclVar extends TreeList<AbstractDeclVar> {

    @Override
    public void decompile(IndentPrintStream s) {
        for (AbstractDeclVar Var : this.getList()) {
            Var.decompile(s);
            s.println();
        }
    }

    /**
     * Implements non-terminal "list_decl_var" of [SyntaxeContextuelle] in pass 3
     * @param compiler contains the "env_types" attribute
     * @param envParam 
     *   its "parentEnvironment" corresponds to "env_exp_sup" attribute
     *   in precondition, its "current" dictionary corresponds to 
     *      the "env_exp" attribute
     *   in postcondition, its "current" dictionary corresponds to 
     *      the "env_exp_r" attribute
     * @param currentClass 
     *          corresponds to "class" attribute (null in the main bloc).
     */    
    void verifyListDeclVariable(DecacCompiler compiler, EnvironmentExp envParam,
            ClassDefinition currentClass) throws ContextualError {
                
                for (AbstractDeclVar Var : this.getList()) {
                    Var.verifyDeclVar(compiler, envParam, currentClass);
                }
         
    }

    protected void codeGenListDeclVar(DecacCompiler compiler){
        for (AbstractDeclVar Var : this.getList()) {
                Var.codeGenDeclVar(compiler);
            }
    }
    protected void codeGenListDeclVarlocal(DecacCompiler compiler){
        for (AbstractDeclVar Var : this.getList()) {
                Var.codeGenDeclVarlocal(compiler);
            }
    }

}
