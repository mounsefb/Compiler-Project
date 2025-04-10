package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ClassType;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.FieldDefinition;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.NullOperand;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.BEQ;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;




public class Selection extends AbstractLValue{

    AbstractExpr objet;
    AbstractIdentifier ident;

    public Selection(AbstractExpr selectExpr, AbstractIdentifier ident){
        Validate.notNull(selectExpr, "NonNullSelectExpressionException: The select expression should not be null.");
        Validate.notNull(ident, "MethodOrFieldDeclarationMissingException: A method or a field declaration is required.");
        this.objet = selectExpr;
        this.ident = ident;
    }
    public AbstractIdentifier getIdent(){
        return ident;
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError {
                

                //On verifie l'expression de la selection
                ClassType typeClass2 = this.objet.verifyExpr(compiler, localEnv, currentClass).asClassType("NonClassObjectSelectionException: The selected object is not a class.", getLocation());

                EnvironmentExp envExp2 = compiler.environmentType.defOfClass(typeClass2.getName()).getMembers();

                if(envExp2.get(this.ident.getName()) == null)throw  new ContextualError("NoSuchFieldException: There is no field with the specified name.", getLocation());

                FieldDefinition defField = envExp2.get(this.ident.getName()).asFieldDefinition("NotAFieldException: The identifier is not a field; it might be a method or another type.", getLocation());

                if(defField == null)throw new ContextualError("UnknownFieldException: The field is unknown or not declared.", getLocation());

                this.ident.setDefinition(defField);

                Type fieldType = defField.getType();

                this.ident.setType(fieldType);

                if(defField.getVisibility() == Visibility.PROTECTED){
                    if(currentClass == null)throw new ContextualError("ProtectedAccessException: Cannot access the attribute because it is declared as protected.", getLocation());
                    boolean condVis = compiler.environmentType.isSubType(typeClass2, currentClass.getType()) && compiler.environmentType.isSubType(currentClass.getType(), defField.getContainingClass().getType());
                    if(! condVis)throw new ContextualError("ProtectedAccessException: Cannot access the attribute because it is declared as protected.", getLocation());
                }

                this.setType(fieldType);
                
                return fieldType;

            }

    @Override
    public void decompile(IndentPrintStream s) {
        this.objet.decompile(s);
        s.print(".");
        this.ident.decompile(s);
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'prettyPrintChildren'");
        objet.prettyPrint(s, prefix, false);
        ident.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        objet.iter(f);
        ident.iter(f);
    }

    //added
    @Override
    public void codeGenInst(DecacCompiler compiler) {
        codeGenInstasssign(compiler, false);
    }

    public void codeGenInstasssign(DecacCompiler compiler, boolean assign) {
        objet.codeGenInst(compiler);// à voir la selection d'un field et où le mettre         
        compiler.addInstruction(new CMP(new NullOperand(),Register.getR(compiler.getHandleMemory().getfull())));
        compiler.addInstruction(new BEQ(compiler.getDn()));
        if (!assign){
        compiler.addInstruction(new LOAD(new RegisterOffset(ident.getFieldDefinition().getIndex(), Register.getR(compiler.getHandleMemory().getfull())),Register.getR(compiler.getHandleMemory().getfull())));
        //il s'agit bien d'un code reccursif , en cas de selection successives  ex : A.x.y.z ( A un objet  et x,y et z des attributs)
        }
    }
    @Override
    protected void codeGenPrint(DecacCompiler compiler) {
        codeGenInst(compiler);
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()),Register.R1));
        ident.getDefinition().getType().codeGenPrint(compiler);
        compiler.getHandleMemory().registerLiberate();

    }
        @Override
    protected void codeGenPrintX(DecacCompiler compiler) {
        codeGenInst(compiler);
        compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()),Register.R1));
        ident.getDefinition().getType().codeGenPrintX(compiler);
        compiler.getHandleMemory().registerLiberate();

    }
    }
    


