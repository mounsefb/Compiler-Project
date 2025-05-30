package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.MUL;
import fr.ensimag.ima.pseudocode.instructions.POP;

/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class And extends AbstractOpBool {

    public And(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }

    @Override
    protected String getOperatorName() {
        return "&&";
    }
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        super.getLeftOperand().codeGenInst(compiler);
        super.getRightOperand().codeGenInst(compiler);
        if(compiler.getHandleMemory().getPushIndex()!=1){
            RegisterOffset reg= new RegisterOffset(0,Register.SP);
            compiler.addInstruction(new MUL(reg,Register.getR(compiler.getHandleMemory().getfull())));
            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();


        }else{
        compiler.addInstruction(new MUL(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
        compiler.getHandleMemory().registerLiberate();


        }
    }

}
