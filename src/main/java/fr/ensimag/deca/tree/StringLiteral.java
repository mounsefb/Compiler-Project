package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.StringType;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateString;
import fr.ensimag.ima.pseudocode.instructions.WSTR;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;

/**
 * String literal
 *
 * @author gl01
 * @date 01/01/2024
 */
public class StringLiteral extends AbstractStringLiteral {

    @Override
    public String getValue() {
        return value;
    }

    private String value;

    public StringLiteral(String value) {
        Validate.notNull(value);
        this.value = value;
    }

    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv,
            ClassDefinition currentClass) throws ContextualError {

        Type t=new StringType(compiler.symbolTable.create("String"));
        this.setType(t);
        return t;

    }

    @Override
    protected void codeGenPrint(DecacCompiler compiler) {
        String nouv_value=value.replace("\\\"", "\"");
        nouv_value=nouv_value.replace("\\\\", "\\");
        compiler.addInstruction(new WSTR(new ImmediateString(nouv_value)));
    }

    @Override
    protected void codeGenPrintX(DecacCompiler compiler) {
        String nouv_value=value.replace("\\\"", "\"");
        nouv_value=nouv_value.replace("\\\\", "\\");
        compiler.addInstruction(new WSTR(new ImmediateString(nouv_value)));
    }

    @Override
    public void decompile(IndentPrintStream s) {
        s.print("\"");
        s.print(this.value);
        s.print("\"");
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        // leaf node => nothing to do
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // leaf node => nothing to do
    }
    
    @Override
    String prettyPrintNode() {
        return "StringLiteral (" + value + ")";
    }

}
