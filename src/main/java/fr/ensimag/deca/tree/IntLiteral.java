package fr.ensimag.deca.tree;

import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.IntType;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateInteger;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.WINT;

import java.io.PrintStream;

/**
 * Integer literal
 *
 * @author gl01
 * @date 01/01/2024
 */
public class IntLiteral extends AbstractExpr {
    public int getValue() {
        return value;
    }

    private int value;

    public IntLiteral(int value) {
        this.value = value;
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
        
                Type t = new IntType(compiler.symbolTable.create("int"));
                this.setType(t);
                return t;

    }


    @Override
    String prettyPrintNode() {
        return "Int (" + getValue() + ")";
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print(Integer.toString(value));
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
    protected void codeGenInst(DecacCompiler compiler){
    if (compiler.getHandleMemory().getfull()+1>compiler.getHandleMemory().getMaxFull()){
        compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull()))); 
        compiler.getHandleMemory().incrementerpush();
        compiler.getHandleMemory().registerLiberate();
    }
    compiler.addInstruction(new LOAD(new ImmediateInteger(value), Register.getR(compiler.getHandleMemory().registreToUse())));

    }

    @Override
    public void codeGenPrint(DecacCompiler compiler) {
        compiler.addInstruction(new LOAD(value,Register.getR(1)));
        compiler.addInstruction(new WINT());
    }
    @Override
    public void codeGenPrintX(DecacCompiler compiler) {
        compiler.addInstruction(new LOAD(value,Register.getR(1)));
        compiler.addInstruction(new WINT());
    }


}
