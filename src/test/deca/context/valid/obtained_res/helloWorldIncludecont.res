DEBUG fr.ensimag.deca.syntax.AbstractDecaLexer.findFile(AbstractDecaLexer.java:179) - Using library file:/mnt/c/Users/AdMiN/Desktop/ENSIMAG/2A/Projet_GL/GL/target/classes/include/hello.decah
DEBUG fr.ensimag.deca.syntax.AbstractDecaLexer.nextToken(AbstractDecaLexer.java:262) - End of file, poping include stack
DEBUG fr.ensimag.deca.syntax.AbstractDecaLexer.findFile(AbstractDecaLexer.java:179) - Using library file:/mnt/c/Users/AdMiN/Desktop/ENSIMAG/2A/Projet_GL/GL/target/classes/include/world.decah
DEBUG fr.ensimag.deca.syntax.AbstractDecaLexer.nextToken(AbstractDecaLexer.java:262) - End of file, poping include stack
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [1, 0] Main
      +> ListDeclVar [List with 0 elements]
      `> ListInst [List with 1 elements]
         []> [1, 2] Println
             `> ListExpr [List with 2 elements]
                []> [1, 10] StringLiteral (Hello)
                ||  type: String
                []> [1, 0] StringLiteral (world !)
                    type: String
