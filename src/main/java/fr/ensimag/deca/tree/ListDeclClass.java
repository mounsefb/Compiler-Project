package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ClassType;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.EnvironmentExp.DoubleDefException;
import fr.ensimag.deca.context.MethodDefinition;
import fr.ensimag.deca.context.Signature;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.deca.tools.SymbolTable.Symbol;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.LabelOperand;
import fr.ensimag.ima.pseudocode.NullOperand;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.STORE;
import org.apache.log4j.Logger;


/**
 *
 * @author gl01
 * @date 01/01/2024
 */
public class ListDeclClass extends TreeList<AbstractDeclClass> {
    private static final Logger LOG = Logger.getLogger(ListDeclClass.class);
    
    @Override
    public void decompile(IndentPrintStream s) {
        for (AbstractDeclClass c : getList()) {
            c.decompile(s);
            s.println();
        }
    }

    /**
     * Pass 1 of [SyntaxeContextuelle]
     */
    void verifyListClass(DecacCompiler compiler) throws ContextualError {
        LOG.debug("verify listClass: start");
        // LOG.debug("verify listClass: end");

            //Creation de la classe Objet 
            Symbol objet = compiler.createSymbol("Object");
            
            ClassDefinition objetDef= new ClassDefinition(new ClassType(objet, Location.BUILTIN, null), Location.BUILTIN, null);
            compiler.environmentType.declareClass(objet, objetDef,getLocation());

            
            for(AbstractDeclClass clas : this.getList()){
                //On la verifie
                clas.verifyClass(compiler);
            }

    }

    /**
     * Pass 2 of [SyntaxeContextuelle]
    */
    public void verifyListClassMembers(DecacCompiler compiler) throws ContextualError {
        
        //Recuperation de la classe Objet
        ClassDefinition objt = compiler.environmentType.defOfClass(compiler.createSymbol("Object"));

        //Recuperation de l'environnement de la class Objet
        EnvironmentExp localEnv = objt.getMembers();
        
        //Creation de la methode equals

        //On creer son symbole d'abord
        Symbol equals = compiler.createSymbol("equals");

        //Creation de la signature

        //Creation du parametre equals(Object other)
        ClassType ctparam = objt.getType(); 

        Signature signeqs = new Signature();
        signeqs.add(ctparam);

        MethodDefinition defEq = new MethodDefinition(compiler.environmentType.BOOLEAN, Location.BUILTIN, signeqs, 1);


        try {
            //Insertion de la methode dans EnvExp De Objet
            localEnv.declare(equals, defEq);
            objt.incNumberOfMethods();
        }catch(DoubleDefException e){
            //Ca doit pas arriver
            throw new ContextualError("DoubleEqualsMethodDefinitionException: The method equals couldn't be defined because it has already been defined. -- InternalError "  , getLocation());
        }


        //Verification des champs et des signatures de methodes des classes
        for(AbstractDeclClass cls : this.getList()){
            cls.verifyClassMembers(compiler);
        }

    }
    
    /**
     * Pass 3 of [SyntaxeContextuelle]
     */
    public void verifyListClassBody(DecacCompiler compiler) throws ContextualError {
    
        for(AbstractDeclClass cls : this.getList()){
            cls.verifyClassBody(compiler);
        }
    }



    
    public void codeGenListclass(DecacCompiler compiler){
        if (this.getList().size()!=0){
            compiler.addComment("Code de la table des méthodes de Object");
            compiler.addInstruction(new LOAD(new NullOperand(), Register.R0));
            compiler.addInstruction(new STORE(Register.R0,new RegisterOffset(compiler.getHandleMemory().incrementeGB(),Register.GB) ));
            Symbol object = compiler.createSymbol("Object");
            Symbol equals =compiler.createSymbol("equals");
            MethodDefinition eqMethode =(MethodDefinition)(compiler.environmentType.defOfClass(object).getMembers().get(equals));
            eqMethode.setLabel(new Label("code.object.equals"));
            compiler.addInstruction(new LOAD(new LabelOperand(eqMethode.getLabel()), Register.R0));
            compiler.addInstruction(new STORE(Register.R0,new RegisterOffset(compiler.getHandleMemory().incrementeGB(),Register.GB) ));
        }
        for (AbstractDeclClass c : this.getList()){
            c.codeGenClass(compiler);
        }
    }
    public void codeGenListInitField(DecacCompiler compiler){
        compiler.addComment("code de l'initialisation des champs");
        for (AbstractDeclClass c : this.getList()){
            c.codeGenInitField(compiler);
        }
    }
    public void codeGenListClassMethode(DecacCompiler compiler){
        compiler.addComment("code des méthodes");
        for (AbstractDeclClass c : this.getList()){
            c.getListDeclMethod().codeGenListDeclMethod(compiler);;
        }
    }


}
