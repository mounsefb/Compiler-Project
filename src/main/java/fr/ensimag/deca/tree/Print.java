package fr.ensimag.deca.tree;
import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.tools.IndentPrintStream;

/**
 * @author gl01
 * @date 01/01/2024
 */
public class Print extends AbstractPrint {
    /**
     * @param arguments arguments passed to the print(...) statement.
     * @param printHex if true, then float should be displayed as hexadecimal (printx)
     */
    public Print(boolean printHex, ListExpr arguments) {
        super(printHex, arguments);
    }

    @Override
    String getSuffix() {
        return "";
    }

    @Override
    public void AffichageHex(IndentPrintStream s) {
            s.print("printx");
    }

    @Override
    public void Affichage(IndentPrintStream s) {
        s.print("print");
    }
    
}
