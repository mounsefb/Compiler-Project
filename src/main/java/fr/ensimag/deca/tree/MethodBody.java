package fr.ensimag.deca.tree;


import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.deca.tools.SymbolTable.Symbol;

import java.io.PrintStream;



public class MethodBody extends AbstractMethodBody {
    private ListDeclVar listVar;
    private ListInst listInst; 

    public MethodBody(ListDeclVar listVar, ListInst listInst){
        this.listVar = listVar;
        this.listInst = listInst;
    }
    // added
    public ListDeclVar getListVar(){
        return listVar;
    }

    @Override
    protected void verifyMethodBody(DecacCompiler compiler, EnvironmentExp localEnv, EnvironmentExp paramEnv, ClassDefinition currentClass, Type rType) throws ContextualError{
        
        //On verifie la liste de declaration de variable
        listVar.verifyListDeclVariable(compiler, paramEnv, currentClass);

        //On verifie la liste d'instruction
        listInst.verifyListInst(compiler, paramEnv, currentClass, rType);

    }

    @Override
    protected void codeGenMethodBody(DecacCompiler compiler){
        listVar.codeGenListDeclVarlocal(compiler);
        listInst.codeGenListInst(compiler);
    }


    @Override
    public void decompile(IndentPrintStream s) {
        s.println("{");
        s.indent();
        this.listVar.decompile(s);
        this.listInst.decompile(s);
        s.unindent();
        s.println("}");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        listVar.prettyPrint(s, prefix, false);
        listInst.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        listVar.iter(f);
        listInst.iter(f);
    }
}