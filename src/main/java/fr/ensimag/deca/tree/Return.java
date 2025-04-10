package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.POP;

import java.io.PrintStream;
import org.apache.commons.lang.Validate;




public class Return extends AbstractInst{

    private AbstractExpr expr;
    
    public Return(AbstractExpr rexpr){
        Validate.notNull(rexpr,"NonNullReturnValueException: The returned value should not be null.");
        this.expr = rexpr;
    }
    
    
    @Override
    protected void verifyInst(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass, Type returnType) throws ContextualError {
        
        //Il faut que le returnType ne soit pas void (3.24)
        if(returnType.isVoid())throw new ContextualError("VoidReturnTypeException: the method is not supposed to return.", getLocation());

        

        //Il faut verifier que l'expression que l'on retourne est une rValue
        this.expr = expr.verifyRValue(compiler, localEnv, currentClass, returnType);

    }

    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'codeGenInst'");
        expr.codeGenInst(compiler); // retour de la méthode se fait en R0
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()), Register.R0));
        for(int i=compiler.getHandleMemory().getMaxFull() ; i>=2;i--){
            compiler.addInstruction(new POP(Register.getR(i)));
        }
        compiler.addInstruction(new BRA(compiler.getRts()));
        compiler.getHandleMemory().registerLiberate();
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print("return ");
        this.expr.decompile(s);
        s.print(";");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'prettyPrintChildren'");
        expr.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'iterChildren'");
        expr.iter(f);
    }


    
}
