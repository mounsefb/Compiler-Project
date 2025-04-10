package fr.ensimag.deca;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;


 
/**
 * User-specified options influencing the compilation.
 *
 * @author gl01
 * @date 01/01/2024
 */
public class CompilerOptions {
    public static final int QUIET = 0;
    public static final int INFO  = 1;
    public static final int DEBUG = 2;
    public static final int TRACE = 3;
    public int getDebug() {
        return debug;
    }

    public boolean getParallel() {
        return parallel;
    }

    public boolean getPrintBanner() {
        return printBanner;
    }

    public boolean getVerification() {
        return verification;
    }

    public boolean getParsing() {
        return containsParser;
    }
    
    public boolean getNoCheck() {
        return noCheck;
    }
    
    public List<File> getSourceFiles() {
        return Collections.unmodifiableList(sourceFiles);
    }


    private int debug = 0;
    private boolean parallel = false;
    private boolean verification = false;
    private boolean printBanner = false;
    int nbrRegistre = -1;
    boolean containsParser = false;
    private boolean noCheck = false;
    private List<File> sourceFiles = new ArrayList<File>();

    
    public void parseArgs(String[] args) throws CLIException {
        // A FAIRE : parcourir args pour positionner les options correctement.
        String fileName = "";

        for(int i = 0; i<args.length;i++){

            String arg = args[i];

            if(arg.endsWith(".deca")){
                fileName = arg;
                sourceFiles.add(new File(fileName));
            }
            //L'option avec le banner
            if ("-b".equals(arg)) {
                printBanner = true;
            }

            //L'option de decompilation
            if ("-p".equals(arg)) {
                containsParser = true;
            }

            //L'option de gestion de parallelisme
            if ("-P".equals(arg)) {
                parallel = true;
            }

            //L'option de debug
            if ("-d".equals(arg)) {
                debug ++;
            }

            //L'otpion de gestion de nombre de registre
            if ("-r".equals(arg)) {
                nbrRegistre = Integer.parseInt(args[i+1]);
            }

            //L'option de verification
            if ("-v".equals(arg)) {
                verification = true;
            }

            //L'option d'abscence de verification
            if ("-n".equals(arg)) {
                noCheck = true;
            }
            

        }

        if((nbrRegistre>-1) && !(4<=nbrRegistre && nbrRegistre<=16))throw new CLIException("Le nbr de regisre doit etre entre 4 et 16");

        if(verification && containsParser){
            displayUsage(); 
            throw new CLIException("Erreur sur la ligne de commande impossibilité de cumuler -v et -p");
        }

        if ((!sourceFiles.isEmpty() || parallel || containsParser || debug > 0 || nbrRegistre > - 1 || verification || noCheck) && printBanner){
            displayUsage();
            throw new CLIException("L'option -b doit etre appele toute seul");
        } 


        if(!printBanner && sourceFiles.isEmpty()){
            throw new CLIException("Il faut entrer un fichier a compiler");
        }
        

        Logger logger = Logger.getRootLogger();
        // map command-line debug option to log4j's level.
        switch (getDebug()) {
        case QUIET: break; // keep default
        case INFO:
            logger.setLevel(Level.INFO); break;
        case DEBUG:
            logger.setLevel(Level.DEBUG); break;
        case TRACE:
            logger.setLevel(Level.TRACE); break;
        default:
            logger.setLevel(Level.ALL); break;
        }
        logger.info("Application-wide trace level set to " + logger.getLevel());

        boolean assertsEnabled = false;
        assert assertsEnabled = true; // Intentional side effect!!!
        if (assertsEnabled) {
            logger.info("Java assertions enabled");
        } else {
            logger.info("Java assertions disabled");
        }


    }

    protected void displayUsage() {
        System.out.println("Usage : decac [[-p | -v] [-n] [-r X] [-d]* [-P] [-w] <fichier deca>...] | [-b]");
    }
}
