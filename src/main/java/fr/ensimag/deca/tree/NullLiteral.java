package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.NullType;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.NullOperand;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.PUSH;

import java.io.PrintStream;


public class NullLiteral extends AbstractExpr{

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError {
                Type t = new NullType(compiler.createSymbol("null"));
                this.setType(t);
        return t;
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print("null");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
    }

    @Override
    String prettyPrintNode() {
        return "Null";
    }

    @Override
    protected void iterChildren(TreeFunction f) {
    }
    @Override
    protected void codeGenInst(DecacCompiler compiler){
    if (compiler.getHandleMemory().getfull()+1>compiler.getHandleMemory().getMaxFull()){
        compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull()))); 
        compiler.getHandleMemory().incrementerpush();
        compiler.getHandleMemory().registerLiberate();
    }
    compiler.addInstruction(new LOAD(new NullOperand(), Register.getR(compiler.getHandleMemory().registreToUse())));

    }
    
}

