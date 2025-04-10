package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.POP;

/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public abstract class AbstractOpCmp extends AbstractBinaryExpr {


    public AbstractOpCmp(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
        Type rightType = this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);
        Type lefType = this.getLeftOperand().verifyExpr(compiler, localEnv, currentClass);


        if( rightType.isFloat() &&  lefType.isInt() ) {
            ConvFloat convfl = new ConvFloat(this.getLeftOperand());
            lefType = convfl.verifyExpr(compiler, localEnv, currentClass);
            this.setLeftOperand(convfl); 
        }
        else if( lefType.isFloat() &&  rightType.isInt() ) {
            this.setRightOperand(new ConvFloat(this.getRightOperand()));
            rightType = this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);
        }

        if( !rightType.sameType(lefType)) throw new ContextualError("IncompatibleTypesException: Cannot compare elements with different types. Ensure that the operands have the same type for the comparison operation. ", getLocation());
        
        if (!((rightType.isFloat() || rightType.isInt()) && (lefType.isFloat() || lefType.isInt()))){
            throw new ContextualError( "IncompatibleTypesException: Only float or int types are accepted for this operation.", getLocation());
        }
        
        this.setType(compiler.environmentType.BOOLEAN);
        return compiler.environmentType.BOOLEAN;
    }
    

    @Override
    public void codeGenInst(DecacCompiler compiler) {
        this.getLeftOperand().codeGenInst(compiler);
        this.getRightOperand().codeGenInst(compiler);
        if(compiler.getHandleMemory().getPushIndex()!=1){
            RegisterOffset reg= new RegisterOffset(0,Register.SP);
            compiler.addInstruction(new CMP(reg,Register.getR(compiler.getHandleMemory().getfull())));
            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();


        }else{
            if(getLeftOperand() instanceof Assign) {
                Assign a = (Assign) getLeftOperand();
                if( a.getLeftOperand() instanceof Identifier){
                Identifier ii = (Identifier) a.getLeftOperand();
                compiler.addInstruction(new LOAD(ii.getExpDefinition().getOperand(), Register.getR(compiler.getHandleMemory().registreToUse())));
                compiler.addInstruction(new CMP(Register.getR(compiler.getHandleMemory().getfull()-1),Register.getR(compiler.getHandleMemory().getfull())));

            }
        }else if (getRightOperand() instanceof Assign) {
            Assign b = (Assign) getRightOperand();
            if( b.getLeftOperand() instanceof Identifier){
            Identifier ii = (Identifier) b.getLeftOperand();
            compiler.addInstruction(new LOAD(ii.getExpDefinition().getOperand(), Register.getR(compiler.getHandleMemory().registreToUse())));
            compiler.addInstruction(new CMP(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
        }
        }
        else {
        compiler.addInstruction(new CMP(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
        }
        compiler.getHandleMemory().registerLiberate();
        }   
    
    }

}
