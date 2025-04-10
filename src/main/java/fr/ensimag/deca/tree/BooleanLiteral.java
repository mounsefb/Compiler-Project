package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.BooleanType;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateInteger;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import java.io.PrintStream;


/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class BooleanLiteral extends AbstractExpr {

    private boolean value;

    public BooleanLiteral(boolean value) {
        this.value = value;
    }

    public boolean getValue() {
        return value;
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
        Type t=new BooleanType(compiler.symbolTable.create("boolean"));
        this.setType(t);
        return t;

    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print(Boolean.toString(value));
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        // leaf node => nothing to do
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // leaf node => nothing to do
    }

    @Override
    String prettyPrintNode() {
        return "BooleanLiteral (" + value + ")";
    }
    
    @Override
    protected void codeGenInst(DecacCompiler compiler){
        int valeur=(value==true)?1:0;
        if (compiler.getHandleMemory().getfull()+1>compiler.getHandleMemory().getMaxFull()){
            compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull()))); 
            compiler.getHandleMemory().incrementerpush();
            compiler.getHandleMemory().registerLiberate();
        }   
        compiler.addInstruction(new LOAD(new ImmediateInteger(valeur), Register.getR(compiler.getHandleMemory().registreToUse())));

     }

}
