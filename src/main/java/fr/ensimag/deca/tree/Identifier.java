package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.Definition;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.ExpDefinition;
import fr.ensimag.deca.context.FieldDefinition;
import fr.ensimag.deca.context.MethodDefinition;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.context.TypeDefinition;
import fr.ensimag.deca.context.VariableDefinition;
import fr.ensimag.deca.tools.DecacInternalError;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.deca.tools.SymbolTable.Symbol;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;




/**
 * Deca Identifier
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Identifier extends AbstractIdentifier {
    
    @Override
    protected void checkDecoration() {
        if (getDefinition() == null) {
            throw new DecacInternalError("Identifier " + this.getName() + " has no attached Definition");
        }
    }

    @Override
    public Definition getDefinition() {
        return definition;
    }

    /**
     * Like {@link #getDefinition()}, but works only if the definition is a
     * ClassDefinition.
     * 
     * This method essentially performs a cast, but throws an explicit exception
     * when the cast fails.
     * 
     * @throws DecacInternalError
     *             if the definition is not a class definition.
     */
    @Override
    public ClassDefinition getClassDefinition() {
        try {
            return (ClassDefinition) definition;
        } catch (ClassCastException e) {
            throw new DecacInternalError(
                    "Identifier "
                            + getName()
                            + " is not a class identifier, you can't call getClassDefinition on it");
        }
    }

    /**
     * Like {@link #getDefinition()}, but works only if the definition is a
     * MethodDefinition.
     * 
     * This method essentially performs a cast, but throws an explicit exception
     * when the cast fails.
     * 
     * @throws DecacInternalError
     *             if the definition is not a method definition.
     */
    @Override
    public MethodDefinition getMethodDefinition() {
        try {
            return (MethodDefinition) definition;
        } catch (ClassCastException e) {
            throw new DecacInternalError(
                    "Identifier "
                            + getName()
                            + " is not a method identifier, you can't call getMethodDefinition on it");
        }
    }

    /**
     * Like {@link #getDefinition()}, but works only if the definition is a
     * FieldDefinition.
     * 
     * This method essentially performs a cast, but throws an explicit exception
     * when the cast fails.
     * 
     * @throws DecacInternalError
     *             if the definition is not a field definition.
     */
    @Override
    public FieldDefinition getFieldDefinition() {
        try {
            return (FieldDefinition) definition;
        } catch (ClassCastException e) {
            throw new DecacInternalError(
                    "Identifier "
                            + getName()
                            + " is not a field identifier, you can't call getFieldDefinition on it");
        }
    }

    /**
     * Like {@link #getDefinition()}, but works only if the definition is a
     * VariableDefinition.
     * 
     * This method essentially performs a cast, but throws an explicit exception
     * when the cast fails.
     * 
     * @throws DecacInternalError
     *             if the definition is not a field definition.
     */
    @Override
    public VariableDefinition getVariableDefinition() {
        try {
            return (VariableDefinition) definition;
        } catch (ClassCastException e) {
            throw new DecacInternalError(
                    "Identifier "
                            + getName()
                            + " is not a variable identifier, you can't call getVariableDefinition on it");
        }
    }

    /**
     * Like {@link #getDefinition()}, but works only if the definition is a ExpDefinition.
     * 
     * This method essentially performs a cast, but throws an explicit exception
     * when the cast fails.
     * 
     * @throws DecacInternalError
     *             if the definition is not a field definition.
     */
    @Override
    public ExpDefinition getExpDefinition() {
        try {
            return (ExpDefinition) definition;
        } catch (ClassCastException e) {
            throw new DecacInternalError(
                    "Identifier "
                            + getName()
                            + " is not a Exp identifier, you can't call getExpDefinition on it");
        }
    }

    @Override
    public void setDefinition(Definition definition) {
        this.definition = definition;
    }

    @Override
    public Symbol getName() {
        return name;
    }

    private Symbol name;

    public Identifier(Symbol name) {
        Validate.notNull(name);
        this.name = name;
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass) throws ContextualError {
        
        ExpDefinition ty =  localEnv.get(name);

        if (ty==null){
            throw new ContextualError("UndeclaredIdentifierException: The identifier was not declared before use.", getLocation());
        }else{
            this.setDefinition(ty);
            this.setType(ty.getType());
            return this.getType();
            }
        
    }

    /**
     * Implements non-terminal "type" of [SyntaxeContextuelle] in the 3 passes
     * @param compiler contains "env_types" attribute
     */

    @Override
    public Type verifyType(DecacCompiler compiler) throws ContextualError {
        //throw new UnsupportedOperationException("not yet implemented");
        
        
        TypeDefinition ty =  compiler.environmentType.defOfType(this.getName());

        if (ty==null){
            throw new ContextualError("UnknownTypeException: The type does not exist in Deca. ", getLocation());
        }else{
            return compiler.environmentType.defOfType(this.getName()).getType();
        }
    }
    
    
    private Definition definition;


    @Override
    protected void iterChildren(TreeFunction f) {
        // leaf node => nothing to do
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // leaf node => nothing to do
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print(name.toString());
    }

    @Override
    String prettyPrintNode() {
        return "Identifier (" + getName() + ")";
    }

    @Override
    protected void prettyPrintType(PrintStream s, String prefix) {
        Definition d = getDefinition();
        if (d != null) {
            s.print(prefix);
            s.print("definition: ");
            s.print(d);
            s.println();
        }
    }
    @Override
    protected void codeGenPrint(DecacCompiler compiler) {
        if(definition.isField()){
            compiler.addInstruction(new LOAD(new RegisterOffset(-2, Register.LB), Register.getR(0)));
            compiler.addInstruction(new LOAD(new RegisterOffset(this.getFieldDefinition().getIndex(), Register.R0), Register.getR(1)));

        }else {
        compiler.addInstruction(new LOAD(this.getExpDefinition().getOperand(),Register.getR(1)));
        }
        definition.getType().codeGenPrint(compiler);

    }

    @Override
    protected void codeGenPrintX(DecacCompiler compiler) {
        if(definition.isField()){
            compiler.addInstruction(new LOAD(new RegisterOffset(-2, Register.LB), Register.getR(0)));
            compiler.addInstruction(new LOAD(new RegisterOffset(this.getFieldDefinition().getIndex(), Register.R0), Register.getR(1)));

        }else {
        compiler.addInstruction(new LOAD(this.getExpDefinition().getOperand(),Register.getR(1)));
        }
        definition.getType().codeGenPrintX(compiler);

    }


    
    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        if(definition.isField()){
            compiler.addInstruction(new LOAD(new RegisterOffset(-2, Register.LB), Register.getR(0)));
            compiler.addInstruction(new LOAD(new RegisterOffset(this.getFieldDefinition().getIndex(), Register.R0), Register.getR(compiler.getHandleMemory().registreToUse())));

        }else {
        if (compiler.getHandleMemory().getfull()+1>compiler.getHandleMemory().getMaxFull()){
            compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull()))); 
            compiler.getHandleMemory().incrementerpush();
            compiler.getHandleMemory().registerLiberate();
        }
        compiler.addInstruction(new LOAD(this.getExpDefinition().getOperand(),Register.getR(compiler.getHandleMemory().registreToUse())));
    }
    }






}
