package fr.ensimag.deca.context;

import fr.ensimag.deca.DecacCompiler;
 import fr.ensimag.deca.tools.SymbolTable;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.POP;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.QUO;
import fr.ensimag.ima.pseudocode.instructions.WINT;

/**
 *
 * @author Ensimag
 * @date 01/01/2024
 */
public class IntType extends Type {

    public IntType(SymbolTable.Symbol name) {
        super(name);
    }

    @Override
    public boolean isInt() {
        return true;
    }
    
    

    @Override
    public boolean sameType(Type otherType) {
        //throw new UnsupportedOperationException("not yet implemented");
        return otherType.isInt();
    }
    @Override
    public void codeGenPrint(DecacCompiler compiler) {
        compiler.addInstruction(new WINT());
    }
    @Override
    public void codeGenPrintX(DecacCompiler compiler) {
        compiler.addInstruction(new WINT());
    }
    @Override
    public void codeGenDivide(DecacCompiler compiler){
        if(compiler.getHandleMemory().getPushIndex()!=1){
            RegisterOffset reg= new RegisterOffset(0,Register.SP);
            RegisterOffset reg1= new RegisterOffset(-1,Register.SP);

            compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull())));
            compiler.getHandleMemory().incrementerpush();
            compiler.addInstruction(new LOAD(reg1,Register.getR(compiler.getHandleMemory().getfull())));

            compiler.addInstruction(new QUO(reg,Register.getR(compiler.getHandleMemory().getfull())));


            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();

            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();



        }else{
            compiler.addInstruction(new QUO(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));

            compiler.getHandleMemory().registerLiberate();

        }
}
}
