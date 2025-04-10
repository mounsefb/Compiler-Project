package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.FLOAT;

/**
 * Conversion of an int into a float. Used for implicit conversions.
 * 
 * @author gl01
 * @date 01/01/2024
 */
public class ConvFloat extends AbstractUnaryExpr {
    public ConvFloat(AbstractExpr operand) {
        super(operand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
                //J'ai ajouté throws contextualError dans la signature; A revoir :)
        this.setType(compiler.environmentType.FLOAT);
        return compiler.environmentType.FLOAT;
    }


    @Override
    protected String getOperatorName() {
        return "/* conv float */";
    }

    @Override
    //Added by Lina 
    void Affichage(IndentPrintStream s){
        //Ne rien faire
    }
    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        this.getOperand().codeGenInst(compiler);
        compiler.addInstruction(new FLOAT(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull())));        
    }

    @Override
    protected void codeGenPrint(DecacCompiler compiler) {
        this.getOperand().codeGenPrint(compiler);
    }
    @Override
    protected void codeGenPrintX(DecacCompiler compiler) {
        this.getOperand().codeGenPrintX(compiler);
    }

}
