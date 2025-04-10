package fr.ensimag.deca.tree;



import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.EnvironmentExp.DoubleDefException;
import fr.ensimag.deca.context.ExpDefinition;
import fr.ensimag.deca.context.MethodDefinition;
import fr.ensimag.deca.context.Signature;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.ADDSP;
import fr.ensimag.ima.pseudocode.instructions.BOV;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.ERROR;
import fr.ensimag.ima.pseudocode.instructions.POP;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.TSTO;
import fr.ensimag.ima.pseudocode.instructions.WNL;
import fr.ensimag.ima.pseudocode.instructions.WSTR;
import java.io.PrintStream;
import java.util.ArrayList;
import org.apache.commons.lang.Validate;
import org.apache.log4j.Logger;






public class DeclMethod extends AbstractDeclMethod{
    private static final Logger LOG = Logger.getLogger(DeclMethod.class);

    private AbstractIdentifier rType;
    private AbstractIdentifier methName;
    private ListDeclParam listParam;
    private AbstractMethodBody methBody;

    public DeclMethod(AbstractIdentifier t, AbstractIdentifier name,  ListDeclParam listParam, AbstractMethodBody methBody) {
        Validate.notNull(t);
        Validate.notNull(name);
        Validate.notNull(listParam);
        Validate.notNull(methBody);

        this.rType = t;
        this.methName = name;
        this.listParam = listParam;
        this.methBody = methBody;
    }
    public AbstractIdentifier getMethName(){
        return methName;
    }
    @Override
    public ListDeclParam  getListParam(){
        return listParam;
    }

    /**
     * @author boutaley malyahl
     * 
     * @param compiler
     * @param localEnv
     * @param superClass
     * @throws ContextualError
     */


    @Override
    protected void verifyListDeclMethodDeuxiemePasse(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
    throws ContextualError{
        
        
        //On verifie que le type de retour de la methode est bien un type definit dans l'environnement des types
        Type t = rType.verifyType(compiler);  
        
        rType.setType(t);

        rType.setDefinition(compiler.environmentType.defOfType(rType.getName()));

        Signature sig = listParam.verifyListDeclParamDeuxiemePasse(compiler);

        ExpDefinition defMethSuperclass = localEnv.getParent().get(methName.getName());

        
        int index;
        
        //Regle (2.7) Si la methode est deja definit dans la super class il faut la redefinir seulement si elle a la meme signature et subType(type de retour)
        if ( defMethSuperclass != null){
            
            MethodDefinition defMethSuperclassAsMeth =  defMethSuperclass.asMethodDefinition("DoubleMethodDeclarationException: The method couldn't be declared in the subclass because it has already been defined in the superclass as a field.", getLocation());


            //Les methodes ont la meme signature et meme type de retour
            if(!(defMethSuperclassAsMeth.getSignature().equals(sig))){

                throw new ContextualError("MethodRedefinitionException: Method overloading is not allowed; only method redefinitions with identical signatures are permitted.", getLocation());
            }else if(!(compiler.environmentType.isSubType(rType.getType(), defMethSuperclassAsMeth.getType()))){
                throw new ContextualError("ReturnTypeMismatchException: Method redefinition is allowed, but the return type must be a subtype of the original method's return type.", getLocation());
            }
            else{
                index = defMethSuperclassAsMeth.getIndex();
            }
        }
        else{
            currentClass.incNumberOfMethods();
            index = currentClass.getNumberOfMethods();
        }
        
        MethodDefinition defMeth = new MethodDefinition(rType.getType(), getLocation(), sig, index);
        
        try{
            localEnv.declare(methName.getName(),defMeth);
        }catch(DoubleDefException e){throw new ContextualError("DoubleMethodDeclarationException: The method couldn't be declared because it has already been defined.", getLocation());}

        this.methName.setDefinition(defMeth);



    }


    @Override
    protected void verifyDeclMethodTroisiemePasse(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition classe)
    throws ContextualError{
        
        
        
        //On verifie que le type de retour de la methode est bien un type definit dans l'environnement des types
        Type returnType = rType.getType();     

        EnvironmentExp envParam =  listParam.verifyListDeclParamTroisiemePasse(compiler);
        envParam.setParent(localEnv);

        //On verifie le corps de la methodes
        methBody.verifyMethodBody(compiler, localEnv, envParam, classe, returnType);

    }

    /* 
    protected void codeGenDeclMeth(DecacCompiler compiler){
        throw new UnsupportedOperationException("Not yet implemented");
        
    } */


    //fr.ensimag.deca.tree.DeclMethod.verifyDeclMethodTroisiemePasse // commented
    @Override
    public void decompile(IndentPrintStream s) {
        this.rType.decompile(s);
        s.print(" ");
        this.methName.decompile(s);
        s.print("(");
        this.listParam.decompile(s);
        s.print(")");
        this.methBody.decompile(s);
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        rType.prettyPrint(s, prefix, false);
        methName.prettyPrint(s, prefix, false);
        listParam.prettyPrint(s, prefix, false);
        methBody.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        rType.iter(f);
        methName.iter(f);
        listParam.iter(f);
        methBody.iter(f);
    }

    @Override
    protected void codeGenDeclMethod(DecacCompiler compiler) {
        int j=-3;
        for (AbstractDeclParam m : listParam.getList()){
            m.getName().getExpDefinition().setOperand(new RegisterOffset(j, Register.LB));
            j--;
        }
        compiler.addLabel(methName.getMethodDefinition().getLabel());
        // a ajouter tsto et modifier getmaxfull
        int d =compiler.getHandleMemory().getfull()>1?compiler.getHandleMemory().getfull()-1:0;
        compiler.addInstruction(new TSTO(d));
        compiler.addInstruction(new BOV(compiler.getPp()));
        compiler.addInstruction(new ADDSP(16));
        
            for(int i=2 ; i<=compiler.getHandleMemory().getMaxFull();i++){
                compiler.addInstruction(new PUSH(Register.getR(i)));
            }
        
     

        methBody.codeGenMethodBody(compiler);
        if (!rType.getType().isVoid()){
            Label label = new Label("etiq_Fin"+methName.getMethodDefinition().getLabel().toString());
            compiler.addInstruction(new BRA(label));
            compiler.addLabel(label);
            // il faut vérifier que le type de retour stockée dans R0 est smeblable à rType
            compiler.addInstruction(new WSTR("sortie de la methode "+methName.getName().getName()+ " sans return" ));
            compiler.addInstruction(new WNL());
            compiler.addInstruction(new ERROR());
        }
        if(rType.getType().isVoid()){
            for(int i=compiler.getHandleMemory().getMaxFull() ; i>=2;i--){
                compiler.addInstruction(new POP(Register.getR(i)));
            }
            compiler.addInstruction(new BRA(compiler.getRts()));
        }

    }

}