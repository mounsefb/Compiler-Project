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
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 12] DeclVar
      |  ||  +> [8, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [8, 10] Identifier (y)
      |  ||  |  definition: variable defined at [8, 10], type=float
      |  ||  `> [8, 14] Initialization
      |  ||     `> [8, 14] Plus
      |  ||        type: float
      |  ||        +> [8, 14] Minus
      |  ||        |  type: float
      |  ||        |  +> [8, 14] Minus
      |  ||        |  |  type: float
      |  ||        |  |  +> [8, 14] Plus
      |  ||        |  |  |  type: Float
      |  ||        |  |  |  +> [8, 14] Float (1.0)
      |  ||        |  |  |  |  type: Float
      |  ||        |  |  |  `> ConvFloat
      |  ||        |  |  |     type: float
      |  ||        |  |  |     `> [8, 20] Int (2)
      |  ||        |  |  |        type: int
      |  ||        |  |  `> [8, 24] Float (2.5)
      |  ||        |  |     type: Float
      |  ||        |  `> ConvFloat
      |  ||        |     type: float
      |  ||        |     `> [8, 30] Int (1)
      |  ||        |        type: int
      |  ||        `> [8, 34] Divide
      |  ||           type: float
      |  ||           +> [8, 34] Multiply
      |  ||           |  type: Float
      |  ||           |  +> ConvFloat
      |  ||           |  |  type: float
      |  ||           |  |  `> [8, 34] Int (10)
      |  ||           |  |     type: int
      |  ||           |  `> [8, 39] Float (5.2)
      |  ||           |     type: Float
      |  ||           `> ConvFloat
      |  ||              type: float
      |  ||              `> [8, 45] Int (10)
      |  ||                 type: int
      |  []> [9, 10] DeclVar
      |      +> [9, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [9, 10] Identifier (x)
      |      |  definition: variable defined at [9, 10], type=float
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [10, 4] Assign
         ||  type: float
         ||  +> [10, 4] Identifier (x)
         ||  |  definition: variable defined at [9, 10], type=float
         ||  `> [10, 8] Plus
         ||     type: float
         ||     +> [10, 8] Minus
         ||     |  type: float
         ||     |  +> [10, 8] Minus
         ||     |  |  type: float
         ||     |  |  +> [10, 8] Plus
         ||     |  |  |  type: Float
         ||     |  |  |  +> [10, 8] Float (1.0)
         ||     |  |  |  |  type: Float
         ||     |  |  |  `> ConvFloat
         ||     |  |  |     type: float
         ||     |  |  |     `> [10, 14] Int (2)
         ||     |  |  |        type: int
         ||     |  |  `> [10, 18] Float (2.5)
         ||     |  |     type: Float
         ||     |  `> ConvFloat
         ||     |     type: float
         ||     |     `> [10, 24] Int (1)
         ||     |        type: int
         ||     `> [10, 28] Divide
         ||        type: float
         ||        +> [10, 28] Multiply
         ||        |  type: Float
         ||        |  +> ConvFloat
         ||        |  |  type: float
         ||        |  |  `> [10, 28] Int (10)
         ||        |  |     type: int
         ||        |  `> [10, 33] Float (5.2)
         ||        |     type: Float
         ||        `> ConvFloat
         ||           type: float
         ||           `> [10, 39] Int (10)
         ||              type: int
         []> [11, 4] Println
             `> ListExpr [List with 1 elements]
                []> [11, 12] Identifier (x)
                    definition: variable defined at [9, 10], type=float
