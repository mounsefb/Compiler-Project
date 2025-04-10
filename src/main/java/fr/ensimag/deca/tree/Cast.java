package fr.ensimag.deca.tree;
import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ClassType;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.FLOAT;
import fr.ensimag.ima.pseudocode.instructions.INT;
import java.io.PrintStream;




public class Cast extends AbstractExpr {

    AbstractIdentifier type;
    AbstractExpr expr;

    public Cast(AbstractIdentifier type, AbstractExpr expr){
        this.type = type;
        this.expr = expr;
    }

    
    @Override
    public void decompile(IndentPrintStream s) {
        s.print("(");
        this.type.decompile(s);
        s.print(")");
        s.print("(");
        this.expr.decompile(s);
        s.print(")");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        type.prettyPrint(s, prefix, false);
        expr.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        type.iter(f);
        expr.iter(f);
    }


    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass) throws ContextualError {
        //Verification du type
        Type t1 = this.type.verifyType(compiler);

        this.type.setType(t1);
        this.type.setDefinition(compiler.environmentType.defOfType(t1.getName()));


        //verification de l'expression a caster et recup de son type
        Type t2 = this.expr.verifyExpr(compiler, localEnv, currentClass);

        //Voir si les deux types sont cast compatibles
        if (!compiler.environmentType.castCompatible(t2, t1))
        {
            // verification de la compatibilite si le type dynamique est different du type statique (cas d'un objet d'une classe)
            ClassDefinition cDynamique = compiler.environmentType.defOfClass(this.expr.getType().getName());
            if(cDynamique != null) {
                Type tDyn = cDynamique.getType();
                if(compiler.environmentType.castCompatible(t1, tDyn)){
                    this.setType(t1);
                    return this.type.getType();
                }else{throw new ContextualError("TypeCastException: Cannot convert " + tDyn.getName()+ " to " + t1.getName() +" (casting failed).", getLocation());}
            }
            else {
                throw new ContextualError("TypeCastException: Cannot convert " + t2.getName()+ " to " + t1.getName() +" (casting failed).", getLocation());
            }
        }
        
        this.setType(t1);
        return this.getType();
    }
    @Override
    protected void codeGenInst(DecacCompiler compiler) {
        if (type.getType().sameType(expr.getType())){
            expr.codeGenInst(compiler);
        }
        else if(type.getType().isFloat() && expr.getType().isInt()){
            expr.codeGenInst(compiler);
            compiler.addInstruction(new FLOAT(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull())));
        }
        else if (type.getType().isInt() && expr.getType().isFloat()){
            expr.codeGenInst(compiler);
            compiler.addInstruction(new INT(Register.getR(compiler.getHandleMemory().getfull()),Register.getR(compiler.getHandleMemory().getfull())));
        }
        else if (type.getType().isClass()||expr.getType().isNull()){
            if(((ClassType)expr.getType()).isSubClassOf(((ClassType)type.getType()))){
                expr.codeGenInst(compiler);
            }else{
                expr.codeGenInst(compiler);
                compiler.addInstruction(new BRA(compiler.getCast()));
            }
        }
    }
}
