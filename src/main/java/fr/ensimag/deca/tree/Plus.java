package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.ADD;
import fr.ensimag.ima.pseudocode.instructions.BOV;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.MUL;
import fr.ensimag.ima.pseudocode.instructions.POP;
import net.bytebuddy.asm.Advice.This;

/**
 * @author gl01
 * @date 01/01/2024
 */
public class Plus extends AbstractOpArith {
    public Plus(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }
 

    @Override
    protected String getOperatorName() {
        return "+";
    }
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        super.getLeftOperand().codeGenInst(compiler);
        super.getRightOperand().codeGenInst(compiler);
        if(compiler.getHandleMemory().getPushIndex()!=1){
            RegisterOffset reg= new RegisterOffset(0,Register.SP);
            compiler.addInstruction(new ADD(reg,Register.getR(compiler.getHandleMemory().getfull())));
            if(!compiler.getCompilerOptions().getNoCheck() && this.getLeftOperand().getType().isFloat() ){
                compiler.addInstruction(new BOV(compiler.getOe()));
            }
            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();


        }else{
            if (getRightOperand() instanceof Assign) {
                Assign b = (Assign) getRightOperand();
                if( b.getLeftOperand() instanceof Identifier){
                Identifier ii = (Identifier) b.getLeftOperand();
                compiler.addInstruction(new LOAD(ii.getExpDefinition().getOperand(), Register.getR(compiler.getHandleMemory().registreToUse())));
                compiler.addInstruction(new CMP(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
            }
        }
        compiler.addInstruction(new ADD(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
        if(!compiler.getCompilerOptions().getNoCheck()&& this.getLeftOperand().getType().isFloat()){
            compiler.addInstruction(new BOV(compiler.getOe()));
        }
        compiler.getHandleMemory().registerLiberate();


        }
    }

}
