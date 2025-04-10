package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.LOAD;

/**
 * Arithmetic binary operations (+, -, /, ...)
 * 
 * @author gl01
 * @date 01/01/2024
 */
public abstract class AbstractOpArith extends AbstractBinaryExpr {

    public AbstractOpArith(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {


        Type rightType = this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);
        Type leftType = this.getLeftOperand().verifyExpr(compiler, localEnv, currentClass);

        if (!((rightType.isFloat() || rightType.isInt()) && (leftType.isFloat() || leftType.isInt()))){
            throw new ContextualError( "IncompatibleTypesException: Only float or int types are accepted for this operation.", getLocation());
        }

        if( leftType.sameType(rightType)){
            this.setType(leftType);
            return leftType;
        }
        else if( rightType.isFloat() &&  leftType.isInt() ) {
            ConvFloat convfl = new ConvFloat(this.getLeftOperand());
            convfl.verifyExpr(compiler, localEnv, currentClass);
            this.setLeftOperand(convfl); 
            this.setType(rightType);
        }
        else if( leftType.isFloat() &&  rightType.isInt() ) {
            this.setRightOperand(new ConvFloat(this.getRightOperand()));
            this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);
            this.setType(leftType);
        }
        return compiler.environmentType.FLOAT;
    }


    
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        this.getLeftOperand().codeGenInst(compiler);
        this.getRightOperand().codeGenInst(compiler);
        
    }
    @Override
    protected void codeGenPrint(DecacCompiler compiler) {
        this.codeGenInst(compiler);
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()), Register.getR(1)));
        compiler.getHandleMemory().registerLiberate();
        this.getType().codeGenPrint(compiler);

        
    }
    @Override
    protected void codeGenPrintX(DecacCompiler compiler) {
        this.codeGenInst(compiler);
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()), Register.getR(1)));
        compiler.getHandleMemory().registerLiberate();
        this.getType().codeGenPrintX(compiler);

        
    }
}


