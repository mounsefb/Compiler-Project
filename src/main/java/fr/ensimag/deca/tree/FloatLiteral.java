package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.FloatType;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateFloat;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.WFLOAT;
import fr.ensimag.ima.pseudocode.instructions.WFLOATX;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;


/**
 * Single precision, floating-point literal
 *
 * @author gl01
 * @date 01/01/2024
 */
public class FloatLiteral extends AbstractExpr {

    public float getValue() {
        return value;
    }

    private float value;

    public FloatLiteral(float value) {
        Validate.isTrue(!Float.isInfinite(value),
                "literal values cannot be infinite");
        Validate.isTrue(!Float.isNaN(value),
                "literal values cannot be NaN");

        this.value = value;
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
        Type t = new FloatType(compiler.symbolTable.create("Float"));
        this.setType(t);
        return t;
        
    }


    @Override
    public void decompile(IndentPrintStream s) {
        s.print(java.lang.Float.toHexString(value));
    }

    @Override
    String prettyPrintNode() {
        return "Float (" + getValue() + ")";
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
    compiler.addInstruction(new LOAD(new ImmediateFloat(value), Register.getR(compiler.getHandleMemory().registreToUse())));

    }
    @Override
    public void codeGenPrint(DecacCompiler compiler) {
        compiler.addInstruction(new LOAD(new ImmediateFloat(value),Register.getR(1)));
        compiler.addInstruction(new WFLOAT());
    }

    @Override
    public void codeGenPrintX(DecacCompiler compiler) {
        compiler.addInstruction(new LOAD(new ImmediateFloat(value),Register.getR(1)));
        compiler.addInstruction(new WFLOATX());
    }

    

}
