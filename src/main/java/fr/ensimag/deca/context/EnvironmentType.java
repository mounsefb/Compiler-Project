package fr.ensimag.deca.context;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.tools.DecacInternalError;
import fr.ensimag.deca.tools.SymbolTable.Symbol;
import fr.ensimag.deca.tree.Location;
import java.util.HashMap;
import java.util.Map;


// A FAIRE: étendre cette classe pour traiter la partie "avec objet" de Déca
/**
 * Environment containing types. Initially contains predefined identifiers, more
 * classes can be added with declareClass().
 *
 * @author gl01
 * @date 01/01/2024
 */
public class EnvironmentType {
    public EnvironmentType(DecacCompiler compiler) {
        
        envTypes = new HashMap<Symbol, TypeDefinition>();
        
        Symbol intSymb = compiler.createSymbol("int");
        INT = new IntType(intSymb);
        envTypes.put(intSymb, new TypeDefinition(INT, Location.BUILTIN));

        Symbol floatSymb = compiler.createSymbol("float");
        FLOAT = new FloatType(floatSymb);
        envTypes.put(floatSymb, new TypeDefinition(FLOAT, Location.BUILTIN));

        Symbol voidSymb = compiler.createSymbol("void");
        VOID = new VoidType(voidSymb);
        envTypes.put(voidSymb, new TypeDefinition(VOID, Location.BUILTIN));

        Symbol booleanSymb = compiler.createSymbol("boolean");
        BOOLEAN = new BooleanType(booleanSymb);
        envTypes.put(booleanSymb, new TypeDefinition(BOOLEAN, Location.BUILTIN));

        Symbol stringSymb = compiler.createSymbol("string");
        STRING = new StringType(stringSymb);
        // not added to envTypes, it's not visible for the user.
        
    }

    private final Map<Symbol, TypeDefinition> envTypes;


    public TypeDefinition defOfType(Symbol s) {
        return envTypes.get(s);
    }


    /**
     * Cette derniere va faire d'abord checker si le nom de la class existe 
     * puis elle va voir si elle st definit comme etant une classe
     * 
     * @param s
     * @return res ClassDefinition la definition de la classe
     */
    public ClassDefinition defOfClass(Symbol s){

        TypeDefinition res = envTypes.get(s);
        try{
            return (ClassDefinition)res;
        }catch(ClassCastException e){
            throw new DecacInternalError(s + "is not a Class Identifier: you can't call defOfClass on it");
        } 

    }

    public final VoidType    VOID;
    public final IntType     INT;
    public final FloatType   FLOAT;
    public final StringType  STRING;
    public final BooleanType BOOLEAN;


    /*
     * Methode pour declarer des classes dans notre environement
     * @author boutaley malyahl
     * 
     * @param Symbol s
     * @param ClassDefinition cDef
     * 
     */
    public void declareClass(Symbol s, ClassDefinition cDef, Location loc)throws ContextualError{
        if(envTypes.containsKey(s))throw new ContextualError("DoubleClassDeclarationException: Class names must be unique. You have declared the class " + s.getName() + " more than once. ", loc);
        envTypes.put(s, cDef);
    }



    /**
     * Methode qui permet de reconnaitre si un Type t2 et un sous Type de t1
     * 
     * @param t1 type
     * @param t2 supertype
     * 
     * @return true si sous type false sinon
     * 
     * @author boutaley 
     * 
     * 
     */
    public boolean isSubType(Type t1, Type t2){
        
        
        //si subclass
        if(t1.isClass() && t2.isClass()){
            return ((ClassType)t1).isSubClassOf((ClassType)t2);
        }
        //Si meme type c'est bon
        if(t1.sameType(t2)) return true;
        //si null
        if(t1.isNull() && t2.isClass())return true;
        //Sinon c'est faux
        return false;
    }
    
    /**
     * Methode qui permet de savoir si On peut affecter à un objet de type T1 une valeur de type T2 
     * 
     * @param Type t1 le type à gauche de l'affectation
     * @param Type t2 le type à droite de l'affectation
     * 
     * @return true si compatible false sinon
     * 
     * @author boutaley
     */
    public boolean assignCompatible(Type t1, Type t2){

        if(t1.isFloat() && t2.isInt())return true;
        if(this.isSubType(t2, t1)) return true;
        return false;
    }
    
     /**
     * Methode qui permet de savoir si On peut convertir de t1 a t2
     * 
     * @param Type t1 le type initial
     * @param Type t2 le type à la fin du cast
     * 
     * @return true si compatible false sinon
     * 
     * @author malyahl boutaley
     */
     
    public boolean castCompatible(Type t1, Type t2){
        if (t1.isVoid()) return false;
        if (this.assignCompatible(t1, t2) || this.assignCompatible(t2, t1)) return true;
        return false;
    }

    /**
     * @author boutaley malyahl
     * 
     * @param t1
     * @param t2
     * @return
     */
    public boolean instanceOfCompatible(Type t1, Type t2){
        if(t1.isClassOrNull() && t2.isClass())return true;
        return false;
    }



}
