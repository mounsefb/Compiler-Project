DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 3 elements]
      |  []> [8, 12] DeclVar
      |  ||  +> [8, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [8, 10] Identifier (x)
      |  ||  |  definition: variable defined at [8, 10], type=float
      |  ||  `> [8, 14] Initialization
      |  ||     `> [8, 14] Float (0.5)
      |  ||        type: Float
      |  []> [9, 12] DeclVar
      |  ||  +> [9, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [9, 10] Identifier (y)
      |  ||  |  definition: variable defined at [9, 10], type=float
      |  ||  `> [9, 14] Initialization
      |  ||     `> [9, 14] Float (1.258)
      |  ||        type: Float
      |  []> [10, 10] DeclVar
      |      +> [10, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [10, 8] Identifier (z)
      |      |  definition: variable defined at [10, 8], type=int
      |      `> [10, 12] Initialization
      |         `> [10, 12] Int (9)
      |            type: int
      `> ListInst [List with 0 elements]
