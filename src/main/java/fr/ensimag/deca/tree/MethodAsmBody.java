package fr.ensimag.deca.tree;


import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import java.io.PrintStream;



public class MethodAsmBody extends AbstractMethodBody  {

    private AbstractStringLiteral string;
    public MethodAsmBody(AbstractStringLiteral str){
        this.string = str;
    }


    @Override
    protected void codeGenMethodBody(DecacCompiler compiler) {
        // TODO
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print("asm(");
        this.string.decompile(s);
        s.print(");");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        this.string.prettyPrint(s, prefix, false);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        this.string.iter(f);
    }

    @Override
    protected void verifyMethodBody(DecacCompiler compiler, EnvironmentExp localEnv, EnvironmentExp paramEnv, ClassDefinition currentClass, Type rType) throws ContextualError {
        
        this.string.verifyExpr(compiler, localEnv, currentClass);

    }
}