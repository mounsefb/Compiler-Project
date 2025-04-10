package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.BLE;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.LOAD;

/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class LowerOrEqual extends AbstractOpIneq {

    public LowerOrEqual(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }


    @Override
    protected String getOperatorName() {
        return "<=";
    }

    @Override
    public void codeGenInst(DecacCompiler compiler) {
        compiler.incrementerLabelCompteur();
        super.codeGenInst(compiler);
        Label label =new Label("lower_or_equal"+compiler.getLabelCompteur());
        Label label2 = new Label("not_lower_or_eq"+compiler.getLabelCompteur());
        compiler.addInstruction(new BLE(label));
        compiler.addInstruction(new LOAD(0,Register.getR(compiler.getHandleMemory().getfull()))); // à verifier si'il faut ajouter un liberate du registre
        compiler.addInstruction(new BRA(label2));
        compiler.addLabel(label);
        compiler.addInstruction(new LOAD(1,Register.getR(compiler.getHandleMemory().getfull())));
        compiler.addLabel(label2);
    }

}
