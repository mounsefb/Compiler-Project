package fr.ensimag.deca.tree;

import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.DecacInternalError;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.STORE;
import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;

/**
 * Assignment, i.e. lvalue = expr.
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Assign extends AbstractBinaryExpr {

    @Override
    public AbstractLValue getLeftOperand() {
        // The cast succeeds by construction, as the leftOperand has been set
        // as an AbstractLValue by the constructor.
        return (AbstractLValue)super.getLeftOperand();
    }

    public Assign(AbstractLValue leftOperand, AbstractExpr rightOperand) {
        super(leftOperand, rightOperand);
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass) throws ContextualError {

            //Je verifie l'expression gauche du assign et recupere son type
            Type leftType = this.getLeftOperand().verifyExpr(compiler, localEnv, currentClass);
            
            //Je verifie l'expression à droite du assign et je le modifie en cas de convFloat
            this.setRightOperand(getRightOperand().verifyRValue(compiler, localEnv, currentClass, leftType));
            //Type rightType = this.getRightOperand().verifyExpr(compiler, localEnv, currentClass);
            
            //Je decore mon arbre avec le type expected qui est celui de gauche
            this.setType(leftType);

            //if(!compiler.environmentType.assignCompatible(leftType, rightType))throw new ContextualError("TypeMismatchException: Unable to assign two expressions of different types. Ensure that the types match or perform a type conversion if necessary. ", getLocation());
            /* 
            else if(leftType.isFloat() &&  rightType.isInt()){
                this.setRightOperand((new ConvFloat(getRightOperand()))); 
                getRightOperand().verifyExpr( compiler,localEnv,  currentClass);
                this.setType(leftType);
                return leftType;
            }*/

            /*else if(leftType.sameType(rightType) ){
                this.setType(rightType);
                return rightType;
            }*/
            
            //Je le retourne
            return leftType;
            
            
            
    }


    @Override
    protected String getOperatorName() {
        return "=";
    }

    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        getRightOperand().codeGenInst(compiler);
        try {
            if(getLeftOperand() instanceof Selection){
                AbstractIdentifier ident =((Selection) getLeftOperand()).getIdent();
                ((Selection)getLeftOperand()).codeGenInstasssign(compiler, true);
                compiler.addInstruction(new STORE(Register.getR(compiler.getHandleMemory().getfull()-1), new RegisterOffset(ident.getFieldDefinition().getIndex(), Register.getR(compiler.getHandleMemory().getfull()))));
                compiler.getHandleMemory().registerLiberate();

            } else{
                Identifier ident = (Identifier) getLeftOperand();
                if (ident.getDefinition().isField()){
                    compiler.addInstruction(new LOAD(new RegisterOffset(-2, Register.LB), Register.R0));
                    compiler.addInstruction(new STORE(Register.getR(compiler.getHandleMemory().getfull()),new RegisterOffset(ident.getFieldDefinition().getIndex(), Register.R0)));
                } else {
                    compiler.addInstruction(new STORE(Register.getR(compiler.getHandleMemory().getfull()), ident.getExpDefinition().getOperand()));
                }
            }
            compiler.getHandleMemory().registerLiberate();




        } catch (ClassCastException e) {
            throw new DecacInternalError(
                    "left Operand "
                            + getLeftOperand()
                            + " is not a identifier, you can't call getExpDefinition on it");
        }
    }

}
