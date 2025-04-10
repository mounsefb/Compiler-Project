package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.BNE;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;


/**
 * Full if/else if/else statement.
 *
 * @author gl01
 * @date 01/01/2024
 */
public class IfThenElse extends AbstractInst {


    
    private final AbstractExpr condition; 
    private final ListInst thenBranch;
    private ListInst elseBranch;

    public IfThenElse(AbstractExpr condition, ListInst thenBranch, ListInst elseBranch) {
        Validate.notNull(condition);
        Validate.notNull(thenBranch);
        Validate.notNull(elseBranch);
        this.condition = condition;
        this.thenBranch = thenBranch;
        this.elseBranch = elseBranch;
    }
    
    
    
    @Override
    protected void verifyInst(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass, Type returnType)
            throws ContextualError {
                
                //Je verifie tout simplement la condtion et les bloc du if et else
                this.condition.verifyCondition(compiler, localEnv, currentClass);
                this.thenBranch.verifyListInst(compiler, localEnv, currentClass, returnType);
                this.elseBranch.verifyListInst(compiler, localEnv, currentClass, returnType);
    }

    @Override
    protected void codeGenInst(DecacCompiler compiler) {
                compiler.incrementerLabelCompteur();
                condition.codeGenInst(compiler); // stock la valeur de notre boolean dans le dernier registre dispo
                Label label =new Label("then"+compiler.getLabelCompteur());
                Label label2 = new Label("else"+compiler.getLabelCompteur());
                Label label3 = new Label ("end_If"+compiler.getLabelCompteur());
                // ON compare le boolean resultat de la condition à 1(true)
                compiler.addInstruction(new CMP(1, Register.getR(compiler.getHandleMemory().getfull()))); 
                compiler.getHandleMemory().registerLiberate();
                compiler.addInstruction(new BNE(label2));
                compiler.addLabel(label);
                /*for (AbstractInst inst : thenBranch.getList()) {
                    inst.codeGenInst(compiler);
                }*/thenBranch.codeGenListInst(compiler);
                compiler.addInstruction(new BRA(label3));
                compiler.addLabel(label2);
                /*for (AbstractInst inst : elseBranch.getList()) {
                    inst.codeGenInst(compiler);
                }*/ elseBranch.codeGenListInst(compiler);
                compiler.addLabel(label3); 

    }

    @Override
    public void decompile(IndentPrintStream s) {

        s.print("if(");
        this.condition.decompile(s);
        s.println("){");
        s.indent();
        this.thenBranch.decompile(s);
        s.unindent();
        s.println("} else {");
        s.indent();
        this.elseBranch.decompile(s);
        s.unindent();
        s.println("}");
    }

    @Override
    protected
    void iterChildren(TreeFunction f) {
        condition.iter(f);
        thenBranch.iter(f);
        elseBranch.iter(f);
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        condition.prettyPrint(s, prefix, false);
        thenBranch.prettyPrint(s, prefix, false);
        elseBranch.prettyPrint(s, prefix, true);
    }
}
