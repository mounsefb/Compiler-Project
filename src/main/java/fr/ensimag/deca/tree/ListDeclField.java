package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.tools.IndentPrintStream;


public class ListDeclField extends TreeList<AbstractDeclField> {
    
    
    /**
     * @author boutaley malyahl
     * 
     * @param compiler
     * @param currentClass
     * @throws ContextualError
     * @return envExpF l'environnement generer par les champs     */ 
    EnvironmentExp verifyListDeclFieldDeuxiemePasse(DecacCompiler  compiler, ClassDefinition currentClass)throws ContextualError{
        
        //Initialisation de l'environnement a retourner initlaiser avec le EnvExp de la superClass
        EnvironmentExp envExpF = new EnvironmentExp(currentClass.getSuperClass().getMembers());      
        
        //On recupere le nbr de champs declarer dans la superClass
        int index = currentClass.getSuperClass().getNumberOfFields();

        //On initialise le nombre de methode de la classe au nombre de sa super
        currentClass.setNumberOfFields(index);
        
        //On verifie l'ensemble des declaration des champs
        for(AbstractDeclField field : this.getList()){
            field.verifyDeclFieldDeuxiemePasse(compiler, envExpF, currentClass);
        }

        //on retourne l'environnement synthetisé
        return envExpF;
    }

    /**
     * @author boutaley malyahl
     * 
     * @param compiler
     * @param envExpF
     * @param currentClass
     * @throws ContextualError
     */
     void verifyListDeclFieldTroisiemePasse(DecacCompiler  compiler,  EnvironmentExp envExpF, ClassDefinition currentClass)throws ContextualError{
        
        
        //On verifie l'ensemble des declaration des champs
        for(AbstractDeclField field : this.getList()){
            field.verifyDeclFieldTroisiemePasse(compiler, envExpF, currentClass);
        }

    }
    
    @Override
    public void decompile(IndentPrintStream s) {
        for (AbstractDeclField Var : this.getList()) {
            Var.decompile(s);
            s.println();
        }
    }
    /*public void codeGenListDeclField(DecacCompiler compiler){
        for (AbstractDeclField c : this.getList()){
            c.codeGenDeclField(compiler);
        }
    }*/
    
}
