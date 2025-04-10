package fr.ensimag.deca;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import org.apache.log4j.Logger;



/**
 * Main class for the command-line Deca compiler.
 *
 * @author gl01
 * @date 01/01/2024
 */
public class DecacMain {
    private static Logger LOG = Logger.getLogger(DecacMain.class);
    


    public static void main(String[] args) {
        // example log4j message.
        LOG.info("Decac compiler started");
        boolean error = false;
        final CompilerOptions options = new CompilerOptions();
        try {
            options.parseArgs(args);
        } catch (CLIException e) {
            System.err.println("Error during option parsing:\n"
                    + e.getMessage());
            options.displayUsage();
            System.exit(1);
        }


        /*
         *  Traitement de l'option -b qui affiche dans le terminal le nom de notre groupe 
         * 
         * @author boutaley
         *  
         */
        if (options.getPrintBanner()) {
            System.out.println("OUR AWESOME TEAM : GL1 GR01");
        }


        /*
         * Gestion de la compilation en parallel
         * 
         * @author boutaley
         */
        if (options.getParallel()) {

            // A FAIRE : instancier DecacCompiler pour chaque fichier à
            // compiler, et lancer l'exécution des méthodes compile() de chaque
            // instance en parallèle. Il est conseillé d'utiliser
            // java.util.concurrent de la bibliothèque standard Java.

            // Obtenez le nombre de processeurs disponibles sur la machine
            int numberOfProcessors = Runtime.getRuntime().availableProcessors();

            //Creation d'ensemble de fils d'execution
            ExecutorService executorService = Executors.newFixedThreadPool(numberOfProcessors);

            // Liste pour stocker les objets Future<Boolean> résultants
            List<Future<Boolean>> futures = new ArrayList<>();

            // Soumettez une tâche par fichier à exécuter
            for (File filePath : options.getSourceFiles()) {
                DecacCompiler compiler = new DecacCompiler(options, filePath);
                // Utilisez une expression lambda pour créer une instance de Callable<Boolean>
                Callable<Boolean> task = () -> {
                //On appelle le compile de chaque instance en parallele
                return compiler.compile();
                };

                // On Soumet la tâche et ajoute le Future résultant à la liste
                futures.add(executorService.submit(task));

            }

            // Attendez que toutes les tâches soient terminées
            for (Future<Boolean> future : futures) {
            try {
                future.get();
                // Traitez le résultat si nécessaire
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();  // Gérez les exceptions appropriées
            }
            }       

            // Fermez l'ExecutorService
            executorService.shutdown();


        } else {
            for (File source : options.getSourceFiles()) {
                DecacCompiler compiler = new DecacCompiler(options, source);
                if (compiler.compile()) {
                    error = true;
                }
            }
        }
        System.exit(error ? 1 : 0);
    }
}
