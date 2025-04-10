package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.tools.IndentPrintStream;

/**
 * List of declarations (e.g. int x; float y,z).
 * 
 * @author gl01
 * @date 01/01/2024
 */
public class ListDeclMethod extends TreeList<AbstractDeclMethod> {
    

    /**
     * @author boutaley malyahl
     * 
     * @param compiler
     * @param currentClass
     * @throws ContextualError
     */
     
    EnvironmentExp verifyListDeclMethodDeuxiemePasse(DecacCompiler  compiler, ClassDefinition currentClass)throws ContextualError{

        //On initialise notre environnement de declaration de methode
        EnvironmentExp envExpM = new EnvironmentExp(currentClass.getSuperClass().getMembers());

        //On recupere le nbr de methode declarer dans la superClass
        int index = currentClass.getSuperClass().getNumberOfMethods();

        //On initialise le nombre de methode de la classe au nombre de sa super
        currentClass.setNumberOfMethods(index);

        //On parcours toute les methodes pour les verifier
        for(AbstractDeclMethod method : this.getList()){
            method.verifyListDeclMethodDeuxiemePasse(compiler, envExpM, currentClass);
        }

        //On retourne l'environnement synthetisé
        return envExpM;
    }

    /**
     * @author boutaley malyahl
     * 
     * @param compiler
     * @param localEnv
     * @param currentClass
     * @throws ContextualError
     */

    void verifyListDeclMethodTroisiemePasse(DecacCompiler  compiler, EnvironmentExp localEnv,  ClassDefinition classe)throws ContextualError{
        
        //On parcours toute les methodes pour les verifier
        for(AbstractDeclMethod method : this.getList()){
            method.verifyDeclMethodTroisiemePasse(compiler, localEnv, classe);
        }

    }

    @Override
    public void decompile(IndentPrintStream s) {
        for (AbstractDeclMethod Var : this.getList()) {
            Var.decompile(s);
            s.println();
        }
    }
    public void codeGenListDeclMethod(DecacCompiler compiler){
        for (AbstractDeclMethod c : this.getList()){
            c.codeGenDeclMethod(compiler);
        }
    }
}
