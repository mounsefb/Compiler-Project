package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.BEQ;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.LEA;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;



public class InstanceOf extends AbstractExpr{
    
    AbstractExpr expr;
    AbstractIdentifier type;

    public InstanceOf(AbstractExpr e, AbstractIdentifier i){
        Validate.notNull(e);
        Validate.notNull(i);
        this.expr = e;
        this.type = i;
    }
    
    
    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError {
                
                Type typeExpr1 = this.expr.verifyExpr(compiler, localEnv, currentClass);
                Type type2 = this.type.verifyType(compiler);
                this.type.setType(type2);
                if(!compiler.environmentType.instanceOfCompatible(typeExpr1, type2)) throw new ContextualError("InstanceOfIncompatibilityException: The instanceof operation cannot be performed because the types are not compatible (Not of type class or null).", getLocation());
                this.type.setDefinition(compiler.environmentType.defOfClass(this.type.getName()));
                this.setType(compiler.environmentType.BOOLEAN);
                return compiler.environmentType.BOOLEAN;

    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print("(");
        this.expr.decompile(s);
        s.print(" instanceof ");
        this.type.decompile(s);
        s.print(")");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        this.expr.prettyPrint(s, prefix, false);
        this.type.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        this.expr.iter(f);
        this.type.iter(f);
    }

    @Override  // added
    protected void codeGenInst(DecacCompiler compiler) {
        compiler.incrementerLabelCompteur();
        Label lab1 = new Label("InstanceOf"+compiler.getLabelCompteur());
        Label lab2 = new Label("notInstanceOf"+compiler.getLabelCompteur());
        Label lab3 = new Label("endInstanceOf"+compiler.getLabelCompteur());
        Label lab4 = new Label("Chainagedepointeurs"+compiler.getLabelCompteur());

        if( type.getClassDefinition().getType().getName().getName()=="Object" ){
            compiler.addInstruction(new LOAD(1, Register.getR(compiler.getHandleMemory().registreToUse())));
        }else{
            compiler.addInstruction(new LEA(new RegisterOffset(1, Register.GB),Register.getR(compiler.getHandleMemory().registreToUse()))); // full-2
            compiler.addInstruction(new LEA(type.getClassDefinition().getOperand(), Register.getR(compiler.getHandleMemory().registreToUse()))); //full-1
            expr.codeGenInst(compiler);  //codeGeninst de la partie gauche (un objet)       full
            
            compiler.addLabel(lab4);
            compiler.addInstruction(new CMP( Register.getR(compiler.getHandleMemory().getfull()-1),Register.getR(compiler.getHandleMemory().getfull())));
            compiler.addInstruction(new BEQ(lab1));
            compiler.addInstruction(new LOAD(new RegisterOffset(0, Register.getR(compiler.getHandleMemory().getfull())),Register.getR(compiler.getHandleMemory().getfull())));
            compiler.addInstruction(new CMP(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-2))); // condition d'arrêt de la boucle
            compiler.addInstruction(new BEQ(lab2));
            compiler.addInstruction(new BRA(lab4));

            compiler.getHandleMemory().registerLiberate();
            compiler.getHandleMemory().registerLiberate();

            compiler.addLabel(lab1);
            compiler.addInstruction(new LOAD(1, Register.getR(compiler.getHandleMemory().getfull())));
            compiler.addInstruction(new BRA(lab3));
            compiler.addLabel(lab2);
            compiler.addInstruction(new LOAD(0, Register.getR(compiler.getHandleMemory().getfull())));
            compiler.addLabel(lab3);
        }



    }
    
}
