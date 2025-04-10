package fr.ensimag.deca.tree;

import fr.ensimag.deca.tools.IndentPrintStream;


/**
 * List of expressions (eg list of parameters).
 *
 * @author gl01
 * @date 01/01/2024
 */
public class ListExpr extends TreeList<AbstractExpr> {


    @Override
    public void decompile(IndentPrintStream s) {
        //throw new UnsupportedOperationException("Not yet implemented");
        int taille = this.size();
        int compteur = 0;
        for (AbstractExpr expr : this.getList()) {
            compteur++;
            expr.decompile(s);
            if (compteur < taille) s.print(",");
        }
    }
}
