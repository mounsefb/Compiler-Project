DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of UneClasse
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of Deux
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [2, 0] ListDeclClass [List with 2 elements]
   |  []> [1, 0] DeclClass
   |  ||  +> [1, 6] Identifier (UneClasse)
   |  ||  |  definition: type defined at [1, 0], type=UneClasse
   |  ||  +> [1, 16] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [2, 0] DeclClass
   |      +> [2, 6] Identifier (Deux)
   |      |  definition: type defined at [2, 0], type=Deux
   |      +> [2, 10] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 0 elements]
   |      `> ListDeclMethod [List with 0 elements]
   `> [4, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [5, 13] DeclVar
      |  ||  +> [5, 4] Identifier (Object)
      |  ||  |  definition: type (builtin), type=Object
      |  ||  +> [5, 11] Identifier (v)
      |  ||  |  definition: variable defined at [5, 11], type=Object
      |  ||  `> [5, 15] Initialization
      |  ||     `> [5, 15] New
      |  ||        type: Deux
      |  ||        +> [5, 19] Identifier (Deux)
      |  ||        |  definition: type defined at [2, 0], type=Deux
      |  []> [6, 21] DeclVar
      |      +> [6, 4] Identifier (UneClasse)
      |      |  definition: type defined at [1, 0], type=UneClasse
      |      +> [6, 14] Identifier (result)
      |      |  definition: variable defined at [6, 14], type=UneClasse
      |      `> [6, 23] Initialization
      |         `> [6, 23] Cast
      |            type: UneClasse
      |            +> [6, 24] Identifier (UneClasse)
      |            |  definition: type defined at [1, 0], type=UneClasse
      |            `> [6, 36] Identifier (v)
      |               definition: variable defined at [5, 11], type=Object
      `> ListInst [List with 0 elements]
