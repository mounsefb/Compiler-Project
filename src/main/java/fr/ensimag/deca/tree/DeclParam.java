package fr.ensimag.deca.tree;



import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.EnvironmentExp.DoubleDefException;
import fr.ensimag.deca.context.ParamDefinition;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;



public class DeclParam extends AbstractDeclParam {
    
    
    private AbstractIdentifier type;
    private AbstractIdentifier name;



    @Override
    public Type getType(){
        return this.type.getType();
    }
    @Override
    public AbstractIdentifier getName(){
        return name;
    }

    public DeclParam(AbstractIdentifier t, AbstractIdentifier name) {
        Validate.notNull(t);
        Validate.notNull(name);
        this.type = t;
        this.name = name;
    }

    @Override
    public void decompile(IndentPrintStream s) {
        this.type.decompile(s);
        s.print(" ");
        this.name.decompile(s);
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        type.prettyPrint(s, prefix, false);
        name.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        type.iter(f);
        name.iter(f);
    }
    
    /**
     * Passe 2
     */
    @Override
    protected Type verifyDeclParamDeuxiemePasse(DecacCompiler compiler) throws ContextualError{

        //Verification du type du parametre
        Type paramType = this.type.verifyType(compiler);
        if(paramType.isVoid())throw new ContextualError("VoidParameterTypeException: Void type is not allowed for method parameters.", getLocation());
        this.type.setType(paramType);


        this.type.setDefinition(compiler.environmentType.defOfType(this.type.getName()));
        return paramType;
    }

    /**
     * Passe 3
     */
    @Override
    protected void verifyDeclParamTroisiemePasse(DecacCompiler compiler, EnvironmentExp envExpP) throws ContextualError{

        //Verification du type du parametre
        Type paramType = this.type.getType();
     
        //Creation de la definition du parametre et association au nom
        ParamDefinition paramDef = new ParamDefinition(paramType, getLocation());
        this.name.setDefinition(paramDef);

        //Ajout dans l'environnement
        try{
            envExpP.declare(name.getName(), paramDef);
        }catch(DoubleDefException e){
            throw new ContextualError("DoubleParameterDeclarationException: The parameter couldn't be declared because it has already been defined. ", getLocation());   
        }

    }


    @Override
    protected void codeGenDeclParam(DecacCompiler compiler) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'codeGenDeclParam'");
    }




    
}