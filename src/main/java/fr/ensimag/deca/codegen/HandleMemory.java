package fr.ensimag.deca.codegen;

public class HandleMemory {
    // en cas de bug , pense à static , il se peut qu'elle soit la source du problème

    private  int full ;
        // the index of the last full register startng from 0 and 1
    private int pushIndex;
        // index of how many values did we push in the stack
    private  int maxFull ;

    private  int lastGB ;
        // the index of the last full GB memory adress starting from 0

    //private int lastSP ;
    private int lastLB ;

    public HandleMemory (){
        full = 1;
        maxFull = 15;
        lastGB = 0;
        pushIndex=1;
        
    }


    public  int registreToUse (){

            full++;
            return full;
        
     }

    public  void registerLiberate(){
        if (full==1){
            //throw new IllegalArgumentException(" you reached R1 !!which is a scratch registre you should not use it!!");
        }
        full-=1;
     }

    public  int incrementeGB (){
        // à gerer plus tard : verifier bien que les GB ne depasse pas le sommet de la pile !!!!
            lastGB+=1;
            return lastGB;
    }
    public  int incrementeLB (){
        // à gerer plus tard : verifier bien que les GB ne depasse pas le sommet de la pile !!!!
            lastLB+=1;
            return lastLB;
    }
    public  int incrementerpush (){
        // à gerer plus tard : verifier bien que les GB ne depasse pas le sommet de la pile !!!!
            pushIndex--;
            return pushIndex;
     }

    public  int decrementerpush (){
        // à gerer plus tard : verifier bien que les GB ne depasse pas le sommet de la pile !!!!
            pushIndex++;
            return pushIndex;
    }


    public  int getfull(){
        return full;
    }

    public  void setMaxFull(int nbrRegistre){
        maxFull = nbrRegistre;
    }

    public  int getLastGB(){
        return lastGB;
    }
    public  int getMaxFull(){
        return maxFull;
    }
    public  int getPushIndex(){
        return pushIndex;
    }



}