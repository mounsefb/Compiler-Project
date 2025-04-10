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
public abstract class AbstractOpExactCmp extends AbstractOpCmp {

    public AbstractOpExactCmp(AbstractExpr leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }


    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError {
                Type lefType = this.getLeftOperand().verifyExpr(compiler, localEnv, currentClass);
                Type righType = this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);
        
                if(lefType.isClassOrNull() && righType.isClassOrNull()){
            this.setType(compiler.environmentType.BOOLEAN);
            return compiler.environmentType.BOOLEAN;

        }
        else if(lefType.isBoolean() && righType.isBoolean()){
            this.setType(compiler.environmentType.BOOLEAN);
            return compiler.environmentType.BOOLEAN;

        }
        else{

            return super.verifyExpr(compiler, localEnv, currentClass);
        }
    }

}
