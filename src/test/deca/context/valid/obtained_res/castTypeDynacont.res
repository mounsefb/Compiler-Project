DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of UneClasse
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of DeuxClasses
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [7, 0] Program
   +> [8, 0] ListDeclClass [List with 2 elements]
   |  []> [7, 0] DeclClass
   |  ||  +> [7, 6] Identifier (UneClasse)
   |  ||  |  definition: type defined at [7, 0], type=UneClasse
   |  ||  +> [7, 16] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [8, 0] DeclClass
   |      +> [8, 6] Identifier (DeuxClasses)
   |      |  definition: type defined at [8, 0], type=DeuxClasses
   |      +> [8, 19] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 0 elements]
   |      `> ListDeclMethod [List with 0 elements]
   `> [10, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [11, 13] DeclVar
      |  ||  +> [11, 4] Identifier (Object)
      |  ||  |  definition: type (builtin), type=Object
      |  ||  +> [11, 11] Identifier (v)
      |  ||  |  definition: variable defined at [11, 11], type=Object
      |  ||  `> [11, 15] Initialization
      |  ||     `> [11, 15] New
      |  ||        type: UneClasse
      |  ||        +> [11, 19] Identifier (UneClasse)
      |  ||        |  definition: type defined at [7, 0], type=UneClasse
      |  []> [12, 23] DeclVar
      |      +> [12, 4] Identifier (DeuxClasses)
      |      |  definition: type defined at [8, 0], type=DeuxClasses
      |      +> [12, 16] Identifier (result)
      |      |  definition: variable defined at [12, 16], type=DeuxClasses
      |      `> [12, 25] Initialization
      |         `> [12, 25] Cast
      |            type: DeuxClasses
      |            +> [12, 26] Identifier (DeuxClasses)
      |            |  definition: type defined at [8, 0], type=DeuxClasses
      |            `> [12, 40] Identifier (v)
      |               definition: variable defined at [11, 11], type=Object
      `> ListInst [List with 0 elements]
