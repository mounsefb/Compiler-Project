package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;



/**
 * @author gl01
 * @date 01/01/2024
 */
public class Initialization extends AbstractInitialization {

    @Override
    public AbstractExpr getExpression() {
        return expression;
    }

    private AbstractExpr expression;

    public void setExpression(AbstractExpr expression) {
        Validate.notNull(expression);
        this.expression = expression;
    }

    public Initialization(AbstractExpr expression) {
        Validate.notNull(expression);
        this.expression = expression;
    }

    @Override
    /**
     * Verification de l'intialization dans la pass 3
     * @author boutaley malyahl
     * 
     * @param compiler containes env_types
     * @param t the type of the field or varianle that is being initialized
     * @param localEnv containes the env_exp the variable or field is being initialzed in
     * @param currentClass the current class where the field is being initialized (null for var init)
     * 
     */
    protected void verifyInitialization(DecacCompiler compiler, Type t, EnvironmentExp localEnv, ClassDefinition currentClass)throws ContextualError {
        
        //On verifie d'abord l'expression dans l'initalisation elle doit etre une rValue.
        this.setExpression(this.expression.verifyRValue(compiler, localEnv, currentClass, t));

        //Type typeExpr = this.expression.verifyExpr(compiler, localEnv, currentClass);
        
        
        //if(!compiler.environmentType.assignCompatible(t, typeExpr))throw new ContextualError("Incompatible Types Initialization", getLocation());
        
       /* if(t.isFloat() &&  typeExpr.isInt()){
            this.setExpression(new ConvFloat(this.expression)); 
            this.expression.verifyExpr( compiler,localEnv,  currentClass);
            return;
        }*/

        //if(t.sameType(typeExpr))return;
    }


    @Override
    public void decompile(IndentPrintStream s) {
        s.print(" = ");
        this.expression.decompile(s);
        s.print(";");
    }

    @Override
    protected
    void iterChildren(TreeFunction f) {
        expression.iter(f);
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        expression.prettyPrint(s, prefix, true);
    }
    //add by zak
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        expression.codeGenInst(compiler);
    }
}
