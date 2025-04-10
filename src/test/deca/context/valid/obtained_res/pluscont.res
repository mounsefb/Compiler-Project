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
      +> ListDeclVar [List with 2 elements]
      |  []> [9, 14] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [9, 8] Identifier (somme)
      |  ||  |  definition: variable defined at [9, 8], type=int
      |  ||  `> [9, 16] Initialization
      |  ||     `> [9, 16] Plus
      |  ||        type: int
      |  ||        +> [9, 16] Int (1)
      |  ||        |  type: int
      |  ||        `> [9, 20] Int (2)
      |  ||           type: int
      |  []> [10, 16] DeclVar
      |      +> [10, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [10, 10] Identifier (shesh)
      |      |  definition: variable defined at [10, 10], type=float
      |      `> [10, 18] Initialization
      |         `> [10, 18] Plus
      |            type: Float
      |            +> [10, 18] Float (17.48)
      |            |  type: Float
      |            `> ConvFloat
      |               type: float
      |               `> [10, 26] Int (89)
      |                  type: int
      `> ListInst [List with 0 elements]
