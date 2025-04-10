package fr.ensimag.deca.context;

import fr.ensimag.deca.tools.SymbolTable.Symbol;
import java.util.HashMap;
import java.util.Map;





/**
 * Dictionary associating identifier's ExpDefinition to their names.
 * 
 * This is actually a linked list of dictionaries: each EnvironmentExp has a
 * pointer to a parentEnvironment, corresponding to superblock (eg superclass).
 * 
 * The dictionary at the head of this list thus corresponds to the "current" 
 * block (eg class).
 * 
 * Searching a definition (through method get) is done in the "current" 
 * dictionary and in the parentEnvironment if it fails. 
 * 
 * Insertion (through method declare) is always done in the "current" dictionary.
 * 
 * @author gl01
 * @date 01/01/2024
 */
public class EnvironmentExp {
    // A FAIRE : implémenter la structure de donnée représentant un
    // environnement (association nom -> définition, avec possibilité
    // d'empilement).

   
    EnvironmentExp parentEnvironment;
    private Map<Symbol, ExpDefinition> map ;

    
    public EnvironmentExp(EnvironmentExp parentEnvironment) {
        this.parentEnvironment = parentEnvironment;
        this.map = new HashMap<Symbol, ExpDefinition>();
    }

    public static class DoubleDefException extends Exception {
        private static final long serialVersionUID = -2733379901827316441L;
    }

    /**
     * Return the definition of the symbol in the environment, or null if the
     * symbol is undefined.
     */
    public ExpDefinition get(Symbol key) {
        if(this.getParent() != null){
            if(this.map.get(key) == null)return this.getParent().get(key);
        }
        return this.map.get(key);
    }
    public Map<Symbol, ExpDefinition> getMap(){
        return map;
    }

    /**
     * Add the definition def associated to the symbol name in the environment.
     * 
     * Adding a symbol which is already defined in the environment,
     * - throws DoubleDefException if the symbol is in the "current" dictionary 
     * - or, hides the previous declaration otherwise.
     * 
     * @param name
     *            Name of the symbol to define
     * @param def
     *            Definition of the symbol
     * @throws DoubleDefException
     *             if the symbol is already defined at the "current" dictionary
     *
     */
    public void declare(Symbol name, ExpDefinition def) throws DoubleDefException {
        if (this.map.containsKey(name)){
            throw new DoubleDefException();
        }
        else {
            this.map.put(name, def); 
        }
    }

    /**
     * retourne l'envExp de la superClass
     * 
     * @author boutaley malyahl
     * @return
     */
    public EnvironmentExp getParent(){
        return this.parentEnvironment;
    }
    /**
     * retourne l'envExp de la superClass
     * 
     * @author boutaley malyahl
     * @return
     */
    public void setParent(EnvironmentExp other){
        this.parentEnvironment = other;
    }

    /**
     * @author boutaley malyahl
     * 
     * @param envExpM
     * @param envExpF
     */
     public void unionDisjoint(EnvironmentExp envExpM,EnvironmentExp envExpF)throws DoubleDefException{


        for(Symbol s : envExpM.map.keySet()){
            this.declare(s, envExpM.map.get(s));
        }

        for(Symbol s : envExpF.map.keySet()){
            this.declare(s, envExpF.map.get(s));
        }
    }
    
    /**
     * @author boutaley malyahl
     * 
     * @param env1
     * @param env2
     */
     public void empi(EnvironmentExp env1,EnvironmentExp env2)throws DoubleDefException{


        for(Symbol s : env1.map.keySet()){
            this.declare(s, env1.map.get(s));
        }

        for(Symbol s : env2.map.keySet()){
            if (!env1.map.containsKey(s))
            this.declare(s, env2.map.get(s));
        }
    }

}
