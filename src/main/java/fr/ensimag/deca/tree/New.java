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
import fr.ensimag.ima.pseudocode.instructions.BOV;
import fr.ensimag.ima.pseudocode.instructions.BSR;
import fr.ensimag.ima.pseudocode.instructions.LEA;
import fr.ensimag.ima.pseudocode.instructions.NEW;
import fr.ensimag.ima.pseudocode.instructions.POP;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.STORE;

import java.io.PrintStream;


public class New extends AbstractExpr{

    AbstractIdentifier ident;

    public New(AbstractIdentifier identifier){
        this.ident = identifier;
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError {

                //on verifie l'element a retourner
                Type type = this.ident.verifyType(compiler);

                ClassDefinition tdef = compiler.environmentType.defOfClass(this.ident.getName());

                this.ident.setDefinition(tdef);


                if(!type.isClass())throw  new ContextualError("new should be called on a class constructor ", getLocation());

                this.setType(type.asClassType("Couldnt convert into a class type while new", getLocation()));

                return this.getType();
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print("new ");
        this.ident.decompile(s);
        s.print("()");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'prettyPrintChildren'");
        ident.prettyPrint(s, prefix, false);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'iterChildren'");
    }
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        compiler.addInstruction(new NEW(ident.getClassDefinition().getNumberOfFields()+1,Register.getR(compiler.getHandleMemory().registreToUse())));
        compiler.addInstruction(new BOV(compiler.getTp()));
        compiler.addInstruction(new LEA(ident.getClassDefinition().getOperand(),Register.R0 ));
        compiler.addInstruction(new STORE(Register.R0, new RegisterOffset(0, Register.getR(compiler.getHandleMemory().getfull()))));
        compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull())));
        compiler.addInstruction(new BSR(new Label("init."+ident.getName().getName())));
        compiler.addInstruction(new POP(Register.getR(compiler.getHandleMemory().getfull())));
        //compiler.getHandleMemory().registerLiberate();

    }   
    
}
