package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.BLT;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.LOAD;

/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Lower extends AbstractOpIneq {



    public Lower(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }


    @Override
    protected String getOperatorName() {
        return "<";
    }

    @Override
    public void codeGenInst(DecacCompiler compiler) {
        compiler.incrementerLabelCompteur();
        super.codeGenInst(compiler);
        Label label =new Label("lower"+compiler.getLabelCompteur());
        Label label2 = new Label("notLower"+compiler.getLabelCompteur());
        compiler.addInstruction(new BLT(label));
        compiler.addInstruction(new LOAD(0,Register.getR(compiler.getHandleMemory().getfull()))); // à verifier si'il faut ajouter un liberate du registre
        compiler.addInstruction(new BRA(label2));
        compiler.addLabel(label);
        compiler.addInstruction(new LOAD(1,Register.getR(compiler.getHandleMemory().getfull())));
        compiler.addLabel(label2);
    }

}
