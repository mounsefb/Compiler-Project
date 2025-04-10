package fr.ensimag.deca.tree;


import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Signature;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;





public class ListDeclParam extends TreeList<AbstractDeclParam> {
    

    /**
     * Passe 2
     * 
     * @param compiler
     * @return
     * @throws ContextualError
     */
    public Signature verifyListDeclParamDeuxiemePasse(DecacCompiler compiler) throws ContextualError {

        Signature res = new Signature();
        Type t;
        
        for(AbstractDeclParam param : this.getList()){
            t = param.verifyDeclParamDeuxiemePasse(compiler);
            res.add(t);
        }
        return res;
    }

    public EnvironmentExp verifyListDeclParamTroisiemePasse(DecacCompiler compiler) throws ContextualError {

        EnvironmentExp envExpP = new EnvironmentExp(null);
        
        for(AbstractDeclParam param : this.getList()){
            param.verifyDeclParamTroisiemePasse(compiler, envExpP);
        }

        return envExpP;
        
}

    @Override
    public void decompile(IndentPrintStream s) {
        int taille = this.size();
        int compteur = 0;
        for (AbstractDeclParam expr : this.getList()) {
            compteur++;
            expr.decompile(s);
            if (compteur < taille) s.print(",");
        }
    }
}