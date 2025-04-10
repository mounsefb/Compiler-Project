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
      +> ListDeclVar [List with 4 elements]
      |  []> [8, 12] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [8, 8] Identifier (res)
      |  ||  |  definition: variable defined at [8, 8], type=int
      |  ||  `> [8, 14] Initialization
      |  ||     `> [8, 14] Divide
      |  ||        type: int
      |  ||        +> [8, 14] Int (20)
      |  ||        |  type: int
      |  ||        `> [8, 19] Int (5)
      |  ||           type: int
      |  []> [9, 15] DeclVar
      |  ||  +> [9, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [9, 10] Identifier (res2)
      |  ||  |  definition: variable defined at [9, 10], type=float
      |  ||  `> [9, 17] Initialization
      |  ||     `> [9, 17] Divide
      |  ||        type: Float
      |  ||        +> [9, 17] Float (10.0)
      |  ||        |  type: Float
      |  ||        `> ConvFloat
      |  ||           type: float
      |  ||           `> [9, 24] Int (5)
      |  ||              type: int
      |  []> [10, 15] DeclVar
      |  ||  +> [10, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [10, 10] Identifier (res3)
      |  ||  |  definition: variable defined at [10, 10], type=float
      |  ||  `> [10, 17] Initialization
      |  ||     `> [10, 17] Divide
      |  ||        type: Float
      |  ||        +> ConvFloat
      |  ||        |  type: float
      |  ||        |  `> [10, 17] Int (45)
      |  ||        |     type: int
      |  ||        `> [10, 22] Float (9.0)
      |  ||           type: Float
      |  []> [11, 15] DeclVar
      |      +> [11, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [11, 10] Identifier (res4)
      |      |  definition: variable defined at [11, 10], type=float
      |      `> [11, 17] Initialization
      |         `> [11, 17] Divide
      |            type: Float
      |            +> [11, 17] Float (50.0)
      |            |  type: Float
      |            `> [11, 24] Float (25.0)
      |               type: Float
      `> ListInst [List with 0 elements]
