package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.OPP;
import fr.ensimag.ima.pseudocode.instructions.WINT;

/**
 * @author gl01
 * @date 01/01/2024
 */
public class UnaryMinus extends AbstractUnaryExpr {

    public UnaryMinus(AbstractExpr operand) {
        super(operand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
            //On verifie l'operande et on decore l'arbe avec son type
            Type t = this.getOperand().verifyExpr(compiler, localEnv, currentClass);
            this.setType(t);
            return t;
    }

    @Override
    void Affichage(IndentPrintStream s){
        s.print("-");
    }

    @Override
    protected String getOperatorName() {
        return "-";
    }

    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        this.getOperand().codeGenInst(compiler);
        compiler.addInstruction(new OPP(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull())));

        
    }

    @Override
    protected void codeGenPrint(DecacCompiler compiler) {
        this.codeGenInst(compiler);
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(1)));
        this.getType().codeGenPrint(compiler);        
    }
    @Override
    protected void codeGenPrintX(DecacCompiler compiler) {
        this.codeGenInst(compiler);
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(1)));
        this.getType().codeGenPrintX(compiler);   
    }

}
