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
 * Print statement (print, println, ...).
 *
 * @author gl01
 * @date 01/01/2024
 */
public abstract class AbstractPrint extends AbstractInst {

    private boolean printHex;
    private ListExpr arguments = new ListExpr();
    
    abstract String getSuffix();

    public AbstractPrint(boolean printHex, ListExpr arguments) {
        Validate.notNull(arguments);
        this.arguments = arguments;
        this.printHex = printHex;
    }

    public ListExpr getArguments() {
        return arguments;
    }

    @Override
    protected void verifyInst(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass, Type returnType)
            throws ContextualError {


                //On verifie les expressions a print
                for (AbstractExpr abstractExpr : arguments.getList() ) {
                    Type t = abstractExpr.verifyExpr(compiler, localEnv, currentClass);
                    //(3.31) condition type = int ou type = float ou type = string
                    if (!t.isInt() && !t.isFloat() && !t.isString()) throw new ContextualError(" InvalidPrintTypeException: The type provided as an argument to the print function is invalid. Only int, string, or float types are allowed. ", getLocation());
                }
    }

    @Override // adnane
    protected void codeGenInst(DecacCompiler compiler) {
        if (printHex == true){
            for (AbstractExpr a : getArguments().getList()) {
            a.codeGenPrintX(compiler);
            }
        }else{
            for (AbstractExpr a : getArguments().getList()) {
            a.codeGenPrint(compiler);
            }
        }
    }

    private boolean getPrintHex() {
        return printHex;
    }

    abstract void Affichage(IndentPrintStream s);

    abstract void AffichageHex(IndentPrintStream s);

    @Override
    public void decompile(IndentPrintStream s) {
        if (this.getPrintHex()) {
            this.AffichageHex(s);
            s.print("(");
        }
        else {
            this.Affichage(s);
            s.print("(");
        }
        this.arguments.decompile(s);
        s.print(");");
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        arguments.iter(f);
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        arguments.prettyPrint(s, prefix, true);
    }

}
