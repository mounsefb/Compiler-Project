package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;


/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Divide extends AbstractOpArith {
    public Divide(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }


    @Override
    protected String getOperatorName() {
        return "/";
    }
    
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        super.getLeftOperand().codeGenInst(compiler);
        super.getRightOperand().codeGenInst(compiler);
        this.getType().codeGenDivide(compiler);
    }
}


