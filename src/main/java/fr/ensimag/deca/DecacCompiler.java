package fr.ensimag.deca;

import fr.ensimag.deca.codegen.HandleMemory;
import fr.ensimag.deca.context.EnvironmentType;
import fr.ensimag.deca.syntax.DecaLexer;
import fr.ensimag.deca.syntax.DecaParser;
import fr.ensimag.deca.tools.DecacInternalError;
import fr.ensimag.deca.tools.SymbolTable;
import fr.ensimag.deca.tools.SymbolTable.Symbol;
import fr.ensimag.deca.tree.AbstractDeclClass;
import fr.ensimag.deca.tree.AbstractDeclMethod;
import fr.ensimag.deca.tree.AbstractProgram;
import fr.ensimag.deca.tree.LocationException;
import fr.ensimag.ima.pseudocode.AbstractLine;
import fr.ensimag.ima.pseudocode.IMAProgram;
import fr.ensimag.ima.pseudocode.Instruction;
import fr.ensimag.ima.pseudocode.Label;
import fr.ensimag.ima.pseudocode.Register;
import fr.ensimag.ima.pseudocode.RegisterOffset;
import fr.ensimag.ima.pseudocode.instructions.ADDSP;
import fr.ensimag.ima.pseudocode.instructions.BEQ;
import fr.ensimag.ima.pseudocode.instructions.BOV;
import fr.ensimag.ima.pseudocode.instructions.BRA;
import fr.ensimag.ima.pseudocode.instructions.CMP;
import fr.ensimag.ima.pseudocode.instructions.ERROR;
import fr.ensimag.ima.pseudocode.instructions.LOAD;
import fr.ensimag.ima.pseudocode.instructions.RTS;
import fr.ensimag.ima.pseudocode.instructions.TSTO;
import fr.ensimag.ima.pseudocode.instructions.WNL;
import fr.ensimag.ima.pseudocode.instructions.WSTR;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.apache.log4j.Logger;

/**
 * Decac compiler instance.
 *
 * This class is to be instantiated once per source file to be compiled. It
 * contains the meta-data used for compiling (source file name, compilation
 * options) and the necessary utilities for compilation (symbol tables, abstract
 * representation of target file, ...).
 *
 * It contains several objects specialized for different tasks. Delegate methods
 * are used to simplify the code of the caller (e.g. call
 * compiler.addInstruction() instead of compiler.getProgram().addInstruction()).
 *
 * @author gl01
 * @date 01/01/2024
 */
public class DecacCompiler {
    private static final Logger LOG = Logger.getLogger(DecacCompiler.class);
    private HandleMemory myHandle ;
    private int labelCompteur=0;
    private Label  oe = new Label("overflow_error");
    private Label soe = new Label("stack_overflow_error");
    private Label ie = new Label("io_error");
    private Label dn = new Label ("Dereferencement.null");
    private Label pp = new Label ("pile_pleine");
    private Label tp = new Label ("tas_plein");
    private Label rts = new Label ("fin_methodes");
    private Label cast = new Label ("cast_incorrect");





    /**
     * Portable newline character.
     */
    private static final String nl = System.getProperty("line.separator", "\n");

    public DecacCompiler(CompilerOptions compilerOptions, File source) {
        super();
        this.compilerOptions = compilerOptions;
        this.source = source;
        myHandle = new HandleMemory();
    }

    public HandleMemory getHandleMemory(){
        return myHandle;
    }

    public int getLabelCompteur(){
        return labelCompteur;
    }
    public void incrementerLabelCompteur(){
        labelCompteur++;
    }

    public Label getOe(){
        return oe;
    }
    public Label getSoe(){
        return soe;
    }
    public Label getIe(){
        return ie;
    }
    public Label getDn(){
        return dn;
    }
    public Label getPp(){
        return pp;
    }
    public Label getTp(){
        return tp;
    }
    public Label getRts(){
        return rts;
    }
    public Label getCast(){
        return cast;
    }

    /**
     * Source file associated with this compiler instance.
     */
    public File getSource() {
        return source;
    }

    /**
     * Compilation options (e.g. when to stop compilation, number of registers
     * to use, ...).
     */
    public CompilerOptions getCompilerOptions() {
        return compilerOptions;
    }

    /**
     * @see
     * fr.ensimag.ima.pseudocode.IMAProgram#add(fr.ensimag.ima.pseudocode.AbstractLine)
     */
    public void add(AbstractLine line) {
        program.add(line);
    }

    /**
     * @see fr.ensimag.ima.pseudocode.IMAProgram#addComment(java.lang.String)
     */
    public void addComment(String comment) {
        program.addComment(comment);
    }

    /**
     * @see
     * fr.ensimag.ima.pseudocode.IMAProgram#addLabel(fr.ensimag.ima.pseudocode.Label)
     */
    public void addLabel(Label label) {
        program.addLabel(label);
    }

    /**
     * @see
     * fr.ensimag.ima.pseudocode.IMAProgram#addInstruction(fr.ensimag.ima.pseudocode.Instruction)
     */
    public void addInstruction(Instruction instruction) {
        program.addInstruction(instruction);
    }

    /**
     * @see
     * fr.ensimag.ima.pseudocode.IMAProgram#addInstruction(fr.ensimag.ima.pseudocode.Instruction,
     * java.lang.String)
     */
    public void addInstruction(Instruction instruction, String comment) {
        program.addInstruction(instruction, comment);
    }
    
    /**
     * @see 
     * fr.ensimag.ima.pseudocode.IMAProgram#display()
     */
    public String displayIMAProgram() {
        return program.display();
    }
    
    private final CompilerOptions compilerOptions;
    private final File source;
    /**
     * The main program. Every instruction generated will eventually end up here.
     */
    private final IMAProgram program = new IMAProgram();

    public IMAProgram getProgram(){
        return program;
    }
 

    /** The global environment for types (and the symbolTable) */
    public final SymbolTable symbolTable = new SymbolTable();
    public final EnvironmentType environmentType = new EnvironmentType(this);


    public Symbol createSymbol(String name) {
        //return null; // A FAIRE: remplacer par la ligne en commentaire ci-dessous
        return this.symbolTable.create(name);
    }

    /**
     * Run the compiler (parse source file, generate code)
     *
     * @return true on error
     */
    public boolean compile() {
        String sourceFile = source.getAbsolutePath();
        String destFile = null;
        // A FAIRE: calculer le nom du fichier .ass à partir du nom du
        // A AFIRE: fichier .deca.
        destFile = sourceFile.replace(".deca", ".ass");
        PrintStream err = System.err;
        PrintStream out = System.out;
        LOG.debug("Compiling file " + sourceFile + " to assembly file " + destFile);
        try {
            return doCompile(sourceFile, destFile, out, err);
        } catch (LocationException e) {
            e.display(err);
            return true;
        } catch (DecacFatalError e) {
            err.println(e.getMessage());
            return true;
        } catch (StackOverflowError e) {
            LOG.debug("stack overflow", e);
            err.println("Stack overflow while compiling file " + sourceFile + ".");
            return true;
        } catch (Exception e) {
            LOG.fatal("Exception raised while compiling file " + sourceFile
                    + ":", e);
            err.println("Internal compiler error while compiling file " + sourceFile + ", sorry.");
            return true;
        } catch (AssertionError e) {
            LOG.fatal("Assertion failed while compiling file " + sourceFile
                    + ":", e);
            err.println("Internal compiler error while compiling file " + sourceFile + ", sorry.");
            return true;
        }
    }

    /**
     * Internal function that does the job of compiling (i.e. calling lexer,
     * verification and code generation).
     *
     * @param sourceName name of the source (deca) file
     * @param destName name of the destination (assembly) file
     * @param out stream to use for standard output (output of decac -p)
     * @param err stream to use to display compilation errors
     *
     * @return true on error
     */
    private boolean doCompile(String sourceName, String destName,
            PrintStream out, PrintStream err)
            throws DecacFatalError, LocationException {
        
        AbstractProgram prog = doLexingAndParsing(sourceName, err);

        if (prog == null) {
            LOG.info("Parsing failed");
            return true;
        }


        if(this.getCompilerOptions().nbrRegistre>-1){
            this.getHandleMemory().setMaxFull(this.getCompilerOptions().nbrRegistre - 1);
        }
        
        assert(prog.checkAllLocations());
        
        if(this.getCompilerOptions().getParsing()){
            System.out.println(prog.decompile());
            return false;
        }
        
        prog.verifyProgram(this);
        assert(prog.checkAllDecorations());

        
        if(this.getCompilerOptions().getVerification()){
            return false;
        }
        int numberdeclVar = (prog.getMain().getListDeclVar()==null)? 0:prog.getMain().getListDeclVar().size();
        int somme = 0;
        int max = 0;
        for (AbstractDeclClass c : prog.getClasses().getList()) {
            somme += c.getListDeclMethod().getList().size() + 2;
            int miniMax = 0; // Initialise miniMax pour chaque classe
            for (AbstractDeclMethod m : c.getListDeclMethod().getList()) {
                if (m.getListParam().size() > miniMax) {
                    miniMax = m.getListParam().size();
                }
            }
            if (miniMax > max) {
                max = miniMax;
            }
        }
        addInstruction(new TSTO(numberdeclVar+somme+2+max+3));
        addInstruction(new BOV(soe));
        addInstruction(new ADDSP(numberdeclVar+somme+18));
        prog.getClasses().codeGenListclass(this);
        addComment("start main program");
        prog.codeGenProgram(this);
        addComment("end main program");
        addLabel(oe);
        addInstruction(new WSTR("Error: Overflow during arithmetic operation"));
        addInstruction(new WNL());
        addInstruction(new ERROR());
        addLabel(soe);
        addInstruction(new WSTR("Error: Stack Overflow "));
        addInstruction(new WNL());
        addInstruction(new ERROR());
        addLabel(ie);
        addInstruction(new WSTR("Error: Input/Output error"));
        addInstruction(new WNL());
        addInstruction(new ERROR());
        addLabel(dn);
        addInstruction(new WSTR("Erreur : dereferencement de null"));
        addInstruction(new WNL());
        addInstruction(new ERROR());
        addLabel(pp);
        addInstruction(new WSTR("Erreur : pile pleine"));
        addInstruction(new WNL());
        addInstruction(new ERROR());
        addLabel(tp);
        addInstruction(new WSTR("Erreur : allocation impossible, tas plein"));
        addInstruction(new WNL());
        addInstruction(new ERROR());
        addLabel(cast);
        addInstruction(new WSTR("la conversion (cast) est incorrecte"));
        addInstruction(new WNL());
        addInstruction(new ERROR());
        prog.getClasses().codeGenListInitField(this);
        prog.getClasses().codeGenListClassMethode(this);
        addLabel(new Label("code.object.equals"));
        addInstruction(new LOAD(new RegisterOffset(-2, Register.LB), Register.R0));
        addInstruction(new CMP(new RegisterOffset(-3, Register.LB), Register.R0));
        Label equal=new Label("if_equal_pour_object.equals");
        addInstruction(new BEQ(equal));
        addInstruction(new LOAD(0,Register.R0));
        addInstruction(new BRA(rts));
        addLabel(equal);
        addInstruction(new LOAD(1,Register.R0));
        addInstruction(new BRA(rts));
        addLabel(rts);
        addInstruction(new RTS());

        LOG.debug("Generated assembly code:" + nl + program.display());
        LOG.info("Output file assembly file is: " + destName);

        FileOutputStream fstream = null;
        try {
            fstream = new FileOutputStream(destName);
        } catch (FileNotFoundException e) {
            throw new DecacFatalError("Failed to open output file: " + e.getLocalizedMessage());
        }

        LOG.info("Writing assembler file ...");

        program.display(new PrintStream(fstream));
        LOG.info("Compilation of " + sourceName + " successful.");
        return false;
    }

    /**
     * Build and call the lexer and parser to build the primitive abstract
     * syntax tree.
     *
     * @param sourceName Name of the file to parse
     * @param err Stream to send error messages to
     * @return the abstract syntax tree
     * @throws DecacFatalError When an error prevented opening the source file
     * @throws DecacInternalError When an inconsistency was detected in the
     * compiler.
     * @throws LocationException When a compilation error (incorrect program)
     * occurs.
     */
    protected AbstractProgram doLexingAndParsing(String sourceName, PrintStream err)
            throws DecacFatalError, DecacInternalError {
        DecaLexer lex;
        try {
            lex = new DecaLexer(CharStreams.fromFileName(sourceName));
        } catch (IOException ex) {
            throw new DecacFatalError("Failed to open input file : " + ex.getLocalizedMessage());
        }
        lex.setDecacCompiler(this);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        DecaParser parser = new DecaParser(tokens);
        parser.setDecacCompiler(this);
        return parser.parseProgramAndManageErrors(err);
    }

}
