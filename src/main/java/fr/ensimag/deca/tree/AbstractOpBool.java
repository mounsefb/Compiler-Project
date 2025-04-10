package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;



/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public abstract class AbstractOpBool extends AbstractBinaryExpr {


    public AbstractOpBool(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {
        Type lefType = this.getLeftOperand().verifyExpr(compiler, localEnv, currentClass);
        Type riType = this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);

        if(!lefType.isBoolean() || !lefType.sameType(riType)) throw new ContextualError("IncompatibleTypesException: Cannot perform operation on incompatible types (Not a boolean type). ", getLocation());
        
        
        this.setType(lefType);
        
        return lefType;

    }

    @Override //adnane
    public void codeGenInst(DecacCompiler compiler) {
        this.getLeftOperand().codeGenInst(compiler);
        this.getRightOperand().codeGenInst(compiler);
        
    }


}
