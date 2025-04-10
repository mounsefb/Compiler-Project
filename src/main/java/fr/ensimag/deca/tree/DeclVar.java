package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.EnvironmentExp.DoubleDefException;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.context.VariableDefinition;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.NullOperand;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.STORE;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;


/**
 * @author gl01
 * @date 01/01/2024
 */
public class DeclVar extends AbstractDeclVar {

    
    final private AbstractIdentifier type;
    final private AbstractIdentifier varName;
    final private AbstractInitialization initialization;

    public DeclVar(AbstractIdentifier type, AbstractIdentifier varName, AbstractInitialization initialization) {
        Validate.notNull(type);
        Validate.notNull(varName);
        Validate.notNull(initialization);
        this.type = type;
        this.varName = varName;
        this.initialization = initialization;
    }

    @Override
    protected void verifyDeclVar(DecacCompiler compiler,
            EnvironmentExp envParam, ClassDefinition currentClass)
            throws ContextualError {

            //Verify type de la variable
            Type t = type.verifyType(compiler); 

            if (t.isVoid()) throw new ContextualError("InvalidTypeDeclarationException: Cannot declare a variable of type void. ", getLocation());
            
            this.type.setDefinition(compiler.environmentType.defOfType(type.getName()));

            this.type.setType(t);
                


            //Declaration de la variable names 
            
            
            //Creation de la definitioon de la variable et association au nom
            VariableDefinition def = new VariableDefinition(t, this.varName.getLocation());

            this.varName.setDefinition(def);
            
            //Ajout dans l'environnement
            try{ 
                envParam.declare(this.varName.getName(), def);

            } catch (DoubleDefException e){
                throw new ContextualError("DoubleVariableDeclarationException: The variable couldn't be declared because it has already been defined.", getLocation());
            }

            //Verify initialization
            initialization.verifyInitialization(compiler, t, envParam, currentClass);
            
    }

    
    @Override
    public void decompile(IndentPrintStream s) {
        this.type.decompile(s);
        s.print(" ");
        this.varName.decompile(s);
        this.initialization.decompile(s);
    }

    @Override
    protected
    void iterChildren(TreeFunction f) {
        type.iter(f);
        varName.iter(f);
        initialization.iter(f);
    }
    
    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        type.prettyPrint(s, prefix, false);
        varName.prettyPrint(s, prefix, false);
        initialization.prettyPrint(s, prefix, true);
    }

        //added by zak
    @Override
    protected void codeGenDeclVar(DecacCompiler compiler) {
        varName.getExpDefinition().setOperand(new RegisterOffset(compiler.getHandleMemory().incrementeGB(),Register.GB));
        if(initialization.getExpression() != null){
            initialization.codeGenInst(compiler);
            compiler.addInstruction(new STORE(Register.getR(compiler.getHandleMemory().getfull()),varName.getExpDefinition().getOperand()));
            compiler.getHandleMemory().registerLiberate();

        }else{
            if(type.getDefinition().isClass()){
                compiler.addInstruction(new LOAD(new NullOperand(),Register.R0));
                compiler.addInstruction(new STORE(Register.R0,varName.getExpDefinition().getOperand()));

            }
        }

    }
    @Override
    protected void codeGenDeclVarlocal(DecacCompiler compiler) {
        varName.getExpDefinition().setOperand(new RegisterOffset(compiler.getHandleMemory().incrementeLB(),Register.LB));
        if(initialization.getExpression() != null){
            initialization.codeGenInst(compiler);
            compiler.addInstruction(new STORE(Register.getR(compiler.getHandleMemory().getfull()),varName.getExpDefinition().getOperand()));
            compiler.getHandleMemory().registerLiberate();

        }

    }
    
}
