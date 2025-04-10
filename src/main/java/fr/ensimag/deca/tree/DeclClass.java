package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ClassType;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.EnvironmentExp.DoubleDefException;
import fr.ensimag.deca.context.MethodDefinition;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.deca.tools.SymbolTable.Symbol;
import fr.ensimag.ima.pseudocode.DAddr;
import fr.ensimag.ima.pseudocode.ImmediateInteger;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.LabelOperand;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.BSR;
import fr.ensimag.ima.pseudocode.instructions.LEA;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.RTS;
import fr.ensimag.ima.pseudocode.instructions.STORE;
import fr.ensimag.ima.pseudocode.instructions.SUBSP;
import java.io.PrintStream;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;
import org.apache.commons.lang.Validate;
import org.apache.log4j.Logger;









/**
 * Declaration of a class (<code>class name extends superClass {members}<code>).
 * 
 * @author gl01
 * @date 01/01/2024
 */
public class DeclClass extends AbstractDeclClass {
    private static final Logger LOG = Logger.getLogger(DeclClass.class);
    
    final private AbstractIdentifier name;
    final private AbstractIdentifier superClass;
    final private ListDeclField listField;
    final private ListDeclMethod listMethod;

    public DeclClass(AbstractIdentifier name, AbstractIdentifier superClass, ListDeclField listField, ListDeclMethod listMethod) {
        Validate.notNull(name);
        Validate.notNull(superClass);
        Validate.notNull(listField, "listField null");
        Validate.notNull(listMethod, "listMethode null");
        this.name = name;
        this.superClass = superClass;
        this.listField = listField;
        this.listMethod = listMethod;
    }

    /*
     * Getters for the different attributs
     */
    @Override
    public AbstractIdentifier 
    getName(){
        return this.name;
    }
    @Override
    public AbstractIdentifier getSupClass(){
        return this.superClass;
    }
    @Override
    public ListDeclField getListDeclField(){
        return this.listField;
    }
    @Override
    public ListDeclMethod getListDeclMethod(){
        return this.listMethod;
    }


    @Override
    public void decompile(IndentPrintStream s) {
        s.print("class ");
        this.name.decompile(s);
        s.print(" extends ");
        this.superClass.decompile(s);
        s.println(" {");
        s.indent();
        this.listField.decompile(s);
        this.listMethod.decompile(s);
        s.unindent();
        s.println("}");
    }



    
    @Override
    /**
     * Passe 1 Verification du nom de la classe en la declarant
    */
     protected void verifyClass(DecacCompiler compiler) throws ContextualError {


        //Verification sur la superClasse

        //Je verifie que la superClasse est bien definie dans notre environnement de type
        Type supTyp = superClass.verifyType(compiler);
        
        //Je verifie que la SuperClass est bien un identificateur de classe
        if(!supTyp.isClass())throw new ContextualError("InvalidSuperclassDeclarationException: The superclass you declared is not a valid class.", getLocation());
        
        superClass.setType(supTyp);

        supTyp = supTyp.asClassType(" This is not supposed to happen because the superClass'type is actually a class ", getLocation());

        //Je recupere la definition de la superClasse
        ClassDefinition superDef = compiler.environmentType.defOfClass(superClass.getName());

        this.superClass.setDefinition(superDef);


        //On declare notre Class

        //On recupere le nom a partir de l'identifier de la classe
        Symbol className = this.getName().getName();

        //On creer notre Type 
        ClassType classType = new ClassType(className, getLocation(), superDef);

        //On creer notre definition pour la classe
        ClassDefinition cDef = new ClassDefinition(classType, getLocation(), superDef);

        //La methode declaClass fais la verification du nom car dans cette derniere si le nom exite deja dans l'environnement des types il  y'a une erreur Contextuelle leve
        compiler.environmentType.declareClass(className, cDef, getLocation());

        this.name.setDefinition(cDef);



    }


    @Override
    /**
     * Passe 2 Verification du nom des methodes et des champs
    */
    protected void verifyClassMembers(DecacCompiler compiler) throws ContextualError {

        
        //Recuperation des Definitions de la class
        ClassDefinition clsDef = compiler.environmentType.defOfClass(this.getName().getName());

        //On verifie les champs declarés

        //On recupere la liste de champs
        ListDeclField lfield = this.getListDeclField();

        //Creation des EnvExp apartir de la verfication des liste de declaration des champs
        EnvironmentExp envExpF = lfield.verifyListDeclFieldDeuxiemePasse(compiler ,clsDef);

        //On verifie la declaration des methodes 

        //Recuperation de la liste des Champs et Methodes De cls
        ListDeclMethod lmthd = this.getListDeclMethod();

        //Creation de EnvExpM a partir de la verificatio, de la declaration des methodes
        EnvironmentExp envExpM = lmthd.verifyListDeclMethodDeuxiemePasse(compiler, clsDef);

        
        try{
            //Empilement des EnvExp
            clsDef.getMembers().unionDisjoint(envExpM, envExpF);
        }catch(DoubleDefException e){
           throw new ContextualError("DoubleDefinitionException : Double Definition of a method or a field", getLocation());
        }
        for (AbstractDeclMethod m : listMethod.getList()){
            DeclMethod m1=(DeclMethod)m;
            m1.getMethName().getMethodDefinition().setLabel(new Label("code."+name.getName().getName()+"."+m1.getMethName().getName().getName()));
        }



    }
    
    
    @Override
    /**
     * Passe 3 Verification du corps des methodes 
     */
    protected void verifyClassBody(DecacCompiler compiler) throws ContextualError {

        LOG.debug("Verifyng the class body of "+ name.getName());

        //On recupere la definition de notre classe
        ClassDefinition clsDef = compiler.environmentType.defOfClass(this.name.getName());

        //Recuperation du EnvExp de cls
        EnvironmentExp currEnv = clsDef.getMembers();

        listField.verifyListDeclFieldTroisiemePasse(compiler, currEnv, clsDef);
        
        listMethod.verifyListDeclMethodTroisiemePasse(compiler, currEnv, clsDef);

    }





    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        //throw new UnsupportedOperationException("Not yet supported");
        name.prettyPrint(s,prefix, false);
        superClass.prettyPrint(s, prefix, false);
        listField.prettyPrint(s, prefix, false);
        listMethod.prettyPrint(s, prefix, true);

    }

    @Override
    protected void iterChildren(TreeFunction f) {
        //throw new UnsupportedOperationException("Not yet supported");
        name.iter(f);
        superClass.iter(f);
        listField.iter(f);
        listMethod.iter(f);
    }

    public TreeMap<Integer, MethodDefinition> genlistMethode(DecacCompiler compiler, EnvironmentExp envThisClass, TreeMap<Integer, MethodDefinition> listMethode) {
        if(envThisClass.getParent() != null){
            TreeMap<Integer, MethodDefinition>superMethode=genlistMethode(compiler, envThisClass.getParent(), listMethode);
            listMethode.putAll(superMethode);
        }
        for (Symbol s : envThisClass.getMap().keySet()) {
            if(envThisClass.getMap().get(s).isMethod()){
            MethodDefinition m =(MethodDefinition) envThisClass.getMap().get(s);
            listMethode.put(m.getIndex(),m);
            }
        }
        return listMethode;

    }

    @Override
    public void codeGenClass(DecacCompiler compiler){
        compiler.addComment("code de la table des méthodes de "+name.getName().getName());
        //  adresse de la super classe si cette dernier n'est pas Object , sinon on utilise celle de Object 
        DAddr adresse = (superClass.getClassDefinition().getType().getName().getName()=="Object")? new RegisterOffset(1,Register.GB):superClass.getClassDefinition().getOperand();
        // load de l'adresse de cette adress dans R0
        compiler.addInstruction(new LEA(adresse, Register.R0));
        // on associe à notre classe  une adresse  GB
        name.getClassDefinition().setOperand(new RegisterOffset(compiler.getHandleMemory().incrementeGB(),Register.GB));
        compiler.addInstruction(new STORE(Register.R0, name.getClassDefinition().getOperand()));
        EnvironmentExp envThisClass =name.getClassDefinition().getMembers();
        // les methodes de la superclasse non redifinie par la classe actuelle ( pour préserver l'ordre )
        TreeMap<Integer, MethodDefinition> listMethode=new TreeMap<Integer, MethodDefinition> ();
        listMethode=genlistMethode(compiler, envThisClass, listMethode);
        Map<Integer, MethodDefinition> sortedMap = listMethode.entrySet().stream().sorted(Map.Entry.comparingByKey()).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, TreeMap::new));
        for (MethodDefinition m : sortedMap.values()){
           compiler.addInstruction(new LOAD(new LabelOperand(m.getLabel()), Register.R0));
           compiler.addInstruction(new STORE(Register.R0,new RegisterOffset(compiler.getHandleMemory().incrementeGB(),Register.GB)));
            
        }

    }
    
    @Override
    public void codeGenInitField(DecacCompiler compiler) {
        //ajouter TSTO
        compiler.addLabel(new Label("init."+ name.getName().getName()));
        if (superClass.getClassDefinition().getType().getName().getName()!="Object"){
            compiler.addInstruction(new LOAD(new RegisterOffset(-2, Register.LB), Register.R1));
            compiler.addInstruction(new PUSH(Register.R1));
            compiler.addInstruction(new BSR(new Label("init."+superClass.getName().getName())));
            compiler.addInstruction(new SUBSP(new ImmediateInteger(1)));
        }
        for (AbstractDeclField f : listField.getList()){
            f.codeGenDeclField(compiler);
        }
        compiler.addInstruction(new RTS());

    }

}
