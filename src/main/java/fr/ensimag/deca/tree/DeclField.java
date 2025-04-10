package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.EnvironmentExp.DoubleDefException;
import fr.ensimag.deca.context.FieldDefinition;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateFloat;
import fr.ensimag.ima.pseudocode.ImmediateInteger;
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
public class DeclField extends AbstractDeclField {

    AbstractIdentifier type;
    AbstractIdentifier varName;
    AbstractInitialization initialization;
    Visibility visibility;


    public DeclField( AbstractIdentifier t, AbstractIdentifier varName, AbstractInitialization initialization, Visibility visibility ) {
        Validate.notNull(t);
        Validate.notNull(varName);
        Validate.notNull(initialization);
        Validate.notNull(visibility);
        
        this.type = t;
        this.varName = varName;
        this.initialization = initialization;
        this.visibility = visibility; 
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print(this.visibility.name().toLowerCase());
        s.print(" ");
        this.type.decompile(s);
        s.print(" ");
        this.varName.decompile(s);
        this.initialization.decompile(s);
    }


    @Override
    String prettyPrintNode(){
        return "DeclField (" + this.visibility.name() + ")";
    }
    
    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        type.prettyPrint(s, prefix, false);
        varName.prettyPrint(s, prefix, false);
        initialization.prettyPrint(s, prefix, true);

    }

    @Override
    protected void iterChildren(TreeFunction f) {
        type.iter(f);
        varName.iter(f);
        initialization.iter(f);
    }

    @Override
    /**
     * Deuxieme Passe : Verification de la declarion de champs, le type diff de void et si la superclasse contient une variable avec le 
     * meme nom que notre champ, alors ca doit etre forcement un champ aussi
     * On declare finalement notre champ dans l'environnement exp
     * 
     * @author boutaley malyahl
     * 
     * 
     */
    protected void verifyDeclFieldDeuxiemePasse(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass) throws ContextualError{
        
        //On verifie le type de declaration du champs
        Type t = this.type.verifyType(compiler);

        this.type.setDefinition(compiler.environmentType.defOfType(this.type.getName()));
        
        if(t.isVoid()) throw new ContextualError("VoidFieldTypeException: It is not allowed to declare a field with the void type.", getLocation());

        this.type.setType(t);

        FieldDefinition def;

        int index;

        //Regle (2.5) Si l'attribut est deja definit dans la super class il faut le redefinir 
        if(localEnv.getParent().get(varName.getName()) != null){
            FieldDefinition fieldSuperClass =  localEnv.getParent().get(varName.getName()).asFieldDefinition("DoubleFieldDeclarationException: The field couldn't be declared in the subclass because it has already been defined in the superclass as a Method.", getLocation());
            index = fieldSuperClass.getIndex();
        }else{
            currentClass.incNumberOfFields();
            index = currentClass.getNumberOfFields();

        }

        def = new FieldDefinition(t, getLocation(), visibility, currentClass, index);
        
        try{
            localEnv.declare(varName.getName(), def);
        }catch(DoubleDefException e){throw new ContextualError("DoubleFieldDeclarationException: The field couldn't be declared because it has already been defined.", getLocation());}

        this.varName.setDefinition(def);
        
    }

    @Override
    protected void verifyDeclFieldTroisiemePasse(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass) throws ContextualError{

        //On verifie le type de declaration du champs
        Type t = this.type.getType();
        
        //on verifie l'initialisation 
        this.initialization.verifyInitialization(compiler, t, localEnv, currentClass);
        

    }

    @Override
    protected void codeGenDeclField(DecacCompiler compiler) {
        if (initialization.getExpression()==null){
            Type type_att =type.getDefinition().getType(); 
            if(type_att.isFloat()){
                compiler.addInstruction(new LOAD (new ImmediateFloat(0), Register.R0));

            }
            else if (type_att.isInt() || type_att.isBoolean()){
                compiler.addInstruction(new LOAD (new ImmediateInteger(0), Register.R0));

            }
            else {
                compiler.addInstruction(new LOAD (new NullOperand(), Register.R0));

            }
        }
        else{
        initialization.codeGenInst(compiler);
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()), Register.R0));
        compiler.getHandleMemory().registerLiberate();
        }
        compiler.addInstruction(new LOAD(new RegisterOffset(-2, Register.LB), Register.R1));
        compiler.addInstruction(new STORE( Register.R0, new RegisterOffset(varName.getFieldDefinition().getIndex(), Register.R1)));
        
    }
}