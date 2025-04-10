package fr.ensimag.deca.context;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.tools.SymbolTable;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.BOV;
import fr.ensimag.ima.pseudocode.instructions.DIV;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.POP;
import fr.ensimag.ima.pseudocode.instructions.PUSH;
import fr.ensimag.ima.pseudocode.instructions.WFLOAT;
import fr.ensimag.ima.pseudocode.instructions.WFLOATX;

/**
 *
 * @author Ensimag
 * @date 01/01/2024
 */
public class FloatType extends Type {

    public FloatType(SymbolTable.Symbol name) {
        super(name);
    }

    @Override
    public boolean isFloat() {
        return true;
    }

    @Override
    public boolean sameType(Type otherType) {
        return otherType.isFloat();
    }
    @Override
    public void codeGenPrint(DecacCompiler compiler) {
        compiler.addInstruction(new WFLOAT());
    }
    @Override
    public void codeGenPrintX(DecacCompiler compiler) {
        compiler.addInstruction(new WFLOATX());
    }
    @Override
    public void codeGenDivide(DecacCompiler compiler){
        if(compiler.getHandleMemory().getPushIndex()!=1){
            RegisterOffset reg= new RegisterOffset(0,Register.SP);
            RegisterOffset reg1= new RegisterOffset(-1,Register.SP);

            compiler.addInstruction(new PUSH(Register.getR(compiler.getHandleMemory().getfull())));
            compiler.getHandleMemory().incrementerpush();
            compiler.addInstruction(new LOAD(reg1,Register.getR(compiler.getHandleMemory().getfull())));

            compiler.addInstruction(new DIV(reg,Register.getR(compiler.getHandleMemory().getfull())));

            if(!compiler.getCompilerOptions().getNoCheck()){
                compiler.addInstruction(new BOV(compiler.getOe()));
            }
            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();

            compiler.addInstruction( new POP(Register.R0));
            compiler.getHandleMemory().decrementerpush();



        }else{
            compiler.addInstruction(new DIV(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull()-1)));
            if(!compiler.getCompilerOptions().getNoCheck()){
                compiler.addInstruction(new BOV(compiler.getOe()));
            }
            compiler.getHandleMemory().registerLiberate();

        }
}

}


