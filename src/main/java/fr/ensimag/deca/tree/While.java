package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.DecacInternalError;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateInteger;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.BEQ;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.CMP;

import java.io.PrintStream;
import org.apache.commons.lang.Validate;



/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class While extends AbstractInst {


    private AbstractExpr condition;
    private ListInst body;

    public AbstractExpr getCondition() {
        return condition;
    }

    public ListInst getBody() {
        return body;
    }

    public While(AbstractExpr condition, ListInst body) {
        Validate.notNull(condition);
        Validate.notNull(body);
        this.condition = condition;
        this.body = body;
    }

    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        compiler.incrementerLabelCompteur();
        Label DebutWhile =new Label("Debut_while"+compiler.getLabelCompteur());
        Label FinWhile =new Label("Fin_while"+compiler.getLabelCompteur());
        compiler.addLabel(DebutWhile);
        condition.codeGenInst(compiler);
        compiler.addInstruction(new CMP(new ImmediateInteger(0), Register.getR(compiler.getHandleMemory().getfull())));
        compiler.getHandleMemory().registerLiberate();
        compiler.addInstruction(new BEQ(FinWhile));
        body.codeGenListInst(compiler);
        compiler.addInstruction(new BRA(DebutWhile));
        compiler.addLabel(FinWhile);
         
        
    }

    @Override
    protected void verifyInst(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass, Type returnType)
            throws ContextualError {
                //On verifie la condition et le bloc d'instruction du while
                this.condition.verifyCondition(compiler, localEnv, currentClass);
                this.body.verifyListInst(compiler, localEnv, currentClass, returnType);
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print("while (");
        getCondition().decompile(s);
        s.println(") {");
        s.indent();
        getBody().decompile(s);
        s.unindent();
        s.print("}");
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        condition.iter(f);
        body.iter(f);
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        condition.prettyPrint(s, prefix, false);
        body.prettyPrint(s, prefix, true);
    }

}
