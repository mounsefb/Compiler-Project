package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.POP;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.REM;

/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Modulo extends AbstractOpArith {

    public Modulo(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
        Type leftType = this.getLeftOperand().verifyExpr(compiler, localEnv, currentClass);
        Type rightType = this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);
        
        if(leftType.isInt() &&  rightType.isInt() ){
            this.setType(rightType);
            return rightType;
        }    
        throw new ContextualError("IncompatibleTypesException: Modulo operation can only be applied to integer types. ", getLocation()); 
    }


    @Override
    protected String getOperatorName() {
        return "%";
    }
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        super.getLeftOperand().codeGenInst(compiler);
        super.getRightOperand().codeGenInst(compiler);
        if(compiler.getHandleMemory().getPushIndex()!=1){
            RegisterOffset reg= new RegisterOffset(0,Register.SP);
            RegisterOffset reg1= new RegisterOffset(-1,Register.SP);

            compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull())));
            compiler.getHandleMemory().incrementerpush();
            compiler.addInstruction(new LOAD(reg1,Register.getR(compiler.getHandleMemory().getfull())));
            
            compiler.addInstruction(new REM(reg,Register.getR(compiler.getHandleMemory().getfull())));
            

            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();

            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();


        }else{
        compiler.addInstruction(new REM(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
        compiler.getHandleMemory().registerLiberate();


        }
    }

}
