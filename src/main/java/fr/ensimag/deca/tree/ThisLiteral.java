package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import java.io.PrintStream;



public class ThisLiteral extends AbstractExpr{

    private boolean impl;

    public ThisLiteral(boolean impl){
        this.impl = impl;
    }

    public boolean getImpl(){
        return this.impl;
    }
    


    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError {

                //on verifie que l'appelle a this a ete fais dans une class et non dans le main(3.43)
                if(currentClass == null) throw new ContextualError("ClassOnlyException: This can only be called within a class and not in the main method.", getLocation());
                this.setType(currentClass.getType());
                return currentClass.getType();
    }

    @Override
    public void decompile(IndentPrintStream s) {
        if (!impl) s.print("this");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'prettyPrintChildren'");
    }

    @Override
    String prettyPrintNode() {
        return "This"; 
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'iterChildren'");
    }

    @Override
    public void codeGenInst(DecacCompiler compiler) {
        compiler.addInstruction(new LOAD(new RegisterOffset(-2, Register.LB) , Register.getR(compiler.getHandleMemory().registreToUse())));

    }
    
}
