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
      |  ||  +> [9, 8] Identifier (s)
      |  ||  |  definition: variable defined at [9, 8], type=int
      |  ||  `> [9, 12] Initialization
      |  ||     `> [9, 12] Int (5)
      |  ||        type: int
      |  []> [10, 12] DeclVar
      |  ||  +> [10, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [10, 10] Identifier (p)
      |  ||  |  definition: variable defined at [10, 10], type=float
      |  ||  `> [10, 14] Initialization
      |  ||     `> [10, 14] Float (1.3598745)
      |  ||        type: Float
      |  []> [11, 14] DeclVar
      |      +> [11, 4] Identifier (boolean)
      |      |  definition: type (builtin), type=boolean
      |      +> [11, 12] Identifier (t)
      |      |  definition: variable defined at [11, 12], type=boolean
      |      `> [11, 16] Initialization
      |         `> [11, 16] BooleanLiteral (false)
      |            type: boolean
      `> ListInst [List with 0 elements]
