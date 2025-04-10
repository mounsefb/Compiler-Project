package fr.ensimag.deca.context;

import java.util.ArrayList;
import java.util.List;

/**
 * Signature of a method (i.e. list of arguments)
 *
 * @author gl01
 * @date 01/01/2024
 */
public class Signature {
    List<Type> args = new ArrayList<Type>();

    public void add(Type t) {
        args.add(t);
    }
    
    public Type paramNumber(int n) {
        return args.get(n);
    }
    
    public int size() {
        return args.size();
    }



    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Signature){
            if(args.size() == ((Signature)obj).size()){
                for(int i = 0; i<args.size();i++){
                    if(args.get(i) != ((Signature)obj).paramNumber(i))return false;
                }
                return true;
            }
            else{
                return false;
            }
        }
        return false;
    }

}
