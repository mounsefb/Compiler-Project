DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [8, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [8, 0] Main
      +> ListDeclVar [List with 3 elements]
      |  []> [9, 10] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [9, 8] Identifier (a)
      |  ||  |  definition: variable defined at [9, 8], type=int
      |  ||  `> [9, 12] Initialization
      |  ||     `> [9, 12] Int (1)
      |  ||        type: int
      |  []> [9, 17] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [9, 15] Identifier (b)
      |  ||  |  definition: variable defined at [9, 15], type=int
      |  ||  `> [9, 19] Initialization
      |  ||     `> [9, 19] Int (2)
      |  ||        type: int
      |  []> [9, 24] DeclVar
      |      +> [9, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [9, 22] Identifier (c)
      |      |  definition: variable defined at [9, 22], type=int
      |      `> [9, 26] Initialization
      |         `> [9, 26] Int (3)
      |            type: int
      `> ListInst [List with 0 elements]
