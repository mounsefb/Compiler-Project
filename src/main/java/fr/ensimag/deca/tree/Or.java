package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.ima.pseudocode.ImmediateInteger;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.ADD;
import fr.ensimag.ima.pseudocode.instructions.BEQ;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.POP;
import fr.ensimag.ima.pseudocode.instructions.SUB;

/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Or extends AbstractOpBool {



    public Or(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }

    @Override
    protected String getOperatorName() {
        return "||";
    }
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        compiler.incrementerLabelCompteur();
        int compteurOrCourrant =  compiler.getLabelCompteur();
        super.getLeftOperand().codeGenInst(compiler);
        super.getRightOperand().codeGenInst(compiler);
        if(compiler.getHandleMemory().getPushIndex()!=1){
            RegisterOffset reg= new RegisterOffset(0,Register.SP);
            compiler.addInstruction(new ADD(reg,Register.getR(compiler.getHandleMemory().getfull())));
            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();


        }else{
        compiler.addInstruction(new ADD(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
        compiler.getHandleMemory().registerLiberate();

        }       
        compiler.addInstruction(new CMP(new ImmediateInteger(2), Register.getR(compiler.getHandleMemory().getfull())));
        Label equal =new Label("equal_or"+compteurOrCourrant);
        Label notequal =new Label("notequal_or"+compteurOrCourrant);
        compiler.addInstruction(new BEQ(equal));
        compiler.addInstruction(new BRA(notequal));
        compiler.addLabel(equal);
        compiler.addInstruction(new SUB(new ImmediateInteger(1), Register.getR(compiler.getHandleMemory().getfull())));
        compiler.addLabel(notequal);
        //compiler.getHandleMemory().registerLiberate();

        
    }


}
