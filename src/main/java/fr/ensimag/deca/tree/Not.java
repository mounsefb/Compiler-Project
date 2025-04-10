package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateInteger;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.BEQ;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.LOAD;

/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Not extends AbstractUnaryExpr {


    public Not(AbstractExpr operand) {
        super(operand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
        Type typeOp = this.getOperand().verifyExpr(compiler, localEnv, currentClass);
        this.setType(typeOp);
        if (typeOp.isNull() || typeOp.isBoolean()) return typeOp;
        throw new ContextualError(" IncompatibleTypesException: Negation cannot be applied to this type. ", getLocation());
    }

    @Override
    void Affichage(IndentPrintStream s){
        s.print("!");
    }

    @Override
    protected String getOperatorName() {
        return "!";
    }
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        compiler.incrementerLabelCompteur();
        int compteurNotCourrant =  compiler.getLabelCompteur();
        this.getOperand().codeGenInst(compiler);
        compiler.addInstruction(new CMP(new ImmediateInteger(0), Register.getR(compiler.getHandleMemory().getfull())));
        compiler.getHandleMemory().registerLiberate();
        Label equal0 =new Label("debutNot"+compteurNotCourrant);
        Label endnot =new Label("endnot"+compteurNotCourrant);
        compiler.addInstruction(new BEQ(equal0));
        compiler.addInstruction(new LOAD(new ImmediateInteger(0), Register.getR(compiler.getHandleMemory().registreToUse())));
        compiler.addInstruction(new BRA(endnot));
        compiler.addLabel(equal0);
        compiler.addInstruction(new LOAD(new ImmediateInteger(1), Register.getR(compiler.getHandleMemory().getfull())));
        compiler.addLabel(endnot);
    }
}
