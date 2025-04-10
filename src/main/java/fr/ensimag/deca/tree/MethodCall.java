package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ClassDefinition;
import fr.ensimag.deca.context.ClassType;
import fr.ensimag.deca.context.ContextualError;
import fr.ensimag.deca.context.EnvironmentExp;
import fr.ensimag.deca.context.MethodDefinition;
import fr.ensimag.deca.context.Type;
import fr.ensimag.deca.tools.IndentPrintStream;
import fr.ensimag.ima.pseudocode.ImmediateInteger;
import fr.ensimag.ima.pseudocode.NullOperand;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.ADDSP;
import fr.ensimag.ima.pseudocode.instructions.BEQ;
import fr.ensimag.ima.pseudocode.instructions.BSR;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.STORE;
import fr.ensimag.ima.pseudocode.instructions.SUBSP;
import java.io.PrintStream;
import org.apache.commons.lang.Validate;




public class MethodCall extends AbstractExpr{

    AbstractExpr objet;
    AbstractIdentifier ident;
    ListExpr args;

        public MethodCall(AbstractExpr selectExpr, AbstractIdentifier ident, ListExpr args){
        Validate.notNull(selectExpr, "NonNullSelectExpressionException: The select expression should not be null.");
        Validate.notNull(ident, "MethodDeclarationMissingException: A method declaration is required");
        Validate.notNull(args, "NonNullArgumentsListException: The list of arguments should not be null.");
        this.objet = selectExpr;
        this.ident = ident;
        this.args = args;
    }
    
    
   



    @Override
    public Type verifyExpr(DecacCompiler compiler, EnvironmentExp localEnv, ClassDefinition currentClass)
            throws ContextualError {
       
        //On doit verifier l'objet qui appel la method
        ClassType typeClass2 = this.objet.verifyExpr(compiler, localEnv, currentClass).asClassType("InvalidObjectClassException: The object on which you're calling a method is not of the expected class type.", getLocation());

        EnvironmentExp envExp2 = compiler.environmentType.defOfClass(typeClass2.getName()).getMembers();

        if(envExp2.get(this.ident.getName()) == null)throw  new ContextualError("MethodNotFoundException: There is no method with the specified name.", getLocation());

        MethodDefinition defMeth = envExp2.get(this.ident.getName()).asMethodDefinition("NotAMethodException: The identifier is not a method -- it's a field.", getLocation());

        if(defMeth == null)throw new ContextualError("UnknownMethodException: The method is unknown or not declared.", getLocation());

        this.ident.setDefinition(defMeth);

        Type methType = defMeth.getType();

        this.ident.setType(methType);

        if(this.args.size() != defMeth.getSignature().size())throw new ContextualError("IncorrectNumberOfParametersException: The method is called with the wrong number of parameters.", getLocation());

        int index = 0;
        //on verifie la liste d'arguments
       /* for(AbstractExpr arg : this.args.getModifList()){
            arg = arg.verifyRValue(compiler, localEnv, currentClass, defMeth.getSignature().paramNumber(index));
            index++;
        }*/
 
        for(int i=0; i<args.size(); i++){
            AbstractExpr arg = this.args.getElem(i);
            this.args.set(i, arg.verifyRValue(compiler, localEnv, currentClass, defMeth.getSignature().paramNumber(index)));
            index++;
        }


        this.setType(methType);

        //On doit retourner le type de retour de la methode
        return ident.getType();
    }

    @Override
    public void decompile(IndentPrintStream s) {
        this.objet.decompile(s);
        if(!(objet instanceof ThisLiteral))s.print(".");
        this.ident.decompile(s);
        s.print("(");
        this.args.decompile(s);
        s.print(")");
    }

    @Override
    protected void prettyPrintChildren(PrintStream s, String prefix) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'prettyPrintChildren'");
        objet.prettyPrint(s, prefix, false);
        ident.prettyPrint(s, prefix, false);
        args.prettyPrint(s, prefix, true);
    }

    @Override
    protected void iterChildren(TreeFunction f) {
        // TODO Auto-generated method stub
        //throw new UnsupportedOperationException("Unimplemented method 'iterChildren'");
        objet.iter(f);
        ident.iter(f);
        args.iter(f);
    }

    @Override
    public void codeGenInst(DecacCompiler compiler) {  
         //On réserve de la place pour les  paramètres
        compiler.addInstruction(new ADDSP(args.getList().size()+1)); 
    
        objet.codeGenInst(compiler) ;     // On continuera à se diriger vers la gauche jusqu'à trouver un identifier ou bien THIS
             
        compiler.addInstruction(new STORE(Register.getR(compiler.getHandleMemory().getfull()), new RegisterOffset(0, Register.SP)));

        compiler.getHandleMemory().registerLiberate();

        int indexparam = -1;

        for ( AbstractExpr E : args.getList()){
            // je met ensuite chaque paramètre dans l'adress du declParam dans la declMethode
            E.codeGenInst(compiler); // E est ensuite storé dans le dernier registre dispo

            if (E instanceof Assign){
                Assign a = (Assign) E;
                if( a.getLeftOperand() instanceof Identifier){
                Identifier ii = (Identifier) a.getLeftOperand();
                compiler.addInstruction(new LOAD(ii.getExpDefinition().getOperand(), Register.R0));
                compiler.addInstruction(new STORE(Register.R0,new RegisterOffset(indexparam, Register.SP)));
                }
            }else{
                compiler.addInstruction(new STORE(Register.getR(compiler.getHandleMemory().getfull()),new RegisterOffset(indexparam, Register.SP)));
                compiler.getHandleMemory().registerLiberate();
            }
            indexparam--; 
        }
        // une fois on a mis l'objet dans sa place et les arguments aussi , on saute vers le label de la methode 
        compiler.addInstruction(new LOAD(new RegisterOffset(0, Register.SP) , Register.getR(compiler.getHandleMemory().registreToUse())));
        compiler.addInstruction(new CMP(new NullOperand() , Register.getR(compiler.getHandleMemory().getfull()) ));
        compiler.addInstruction(new BEQ(compiler.getDn()));

        compiler.addInstruction(new LOAD(new RegisterOffset(0,  Register.getR(compiler.getHandleMemory().getfull())),  Register.getR(compiler.getHandleMemory().getfull())));
        compiler.addInstruction(new BSR(new RegisterOffset( ident.getMethodDefinition().getIndex(), Register.getR(compiler.getHandleMemory().getfull()))));
        compiler.addInstruction(new SUBSP(new ImmediateInteger(args.getList().size()+1)));
        if(ident.getType().isVoid()){
        compiler.getHandleMemory().registerLiberate();
        }else{
            compiler.addInstruction(new LOAD(Register.R0,  Register.getR(compiler.getHandleMemory().getfull())));

        }

    }

    @Override
    protected void codeGenPrint(DecacCompiler compiler) {
        if(ident.getType().isVoid()){
            throw new IllegalArgumentException("This method's type of return is void !!");
            // à reverifier le cas de mthode de retour void 
        }else{
            this.codeGenInst(compiler);
            compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()), Register.R1));
            ident.getDefinition().getType().codeGenPrint(compiler);
            compiler.getHandleMemory().registerLiberate();
        }
    }
        @Override
    protected void codeGenPrintX(DecacCompiler compiler) {
        if(ident.getType().isVoid()){
            throw new IllegalArgumentException("This method's type of return is void !!");
            // à reverifier le cas de mthode de retour void 
        }else{
            this.codeGenInst(compiler);
            compiler.addInstruction(new LOAD(Register.getR(compiler.getHandleMemory().getfull()), Register.R1));
            ident.getDefinition().getType().codeGenPrintX(compiler);
            compiler.getHandleMemory().registerLiberate();

        }
    }
    
}
