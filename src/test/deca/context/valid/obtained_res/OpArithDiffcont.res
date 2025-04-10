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
      |  []> [9, 10] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [9, 8] Identifier (x)
      |  ||  |  definition: variable defined at [9, 8], type=int
      |  ||  `> [9, 12] Initialization
      |  ||     `> [9, 12] Minus
      |  ||        type: int
      |  ||        +> [9, 12] Plus
      |  ||        |  type: int
      |  ||        |  +> [9, 12] Int (1)
      |  ||        |  |  type: int
      |  ||        |  `> [9, 16] Int (2)
      |  ||        |     type: int
      |  ||        `> [9, 20] Multiply
      |  ||           type: int
      |  ||           +> [9, 20] Int (3)
      |  ||           |  type: int
      |  ||           `> [9, 24] Int (4)
      |  ||              type: int
      |  []> [10, 10] DeclVar
      |      +> [10, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [10, 8] Identifier (y)
      |      |  definition: variable defined at [10, 8], type=int
      |      `> [10, 12] Initialization
      |         `> [10, 12] Minus
      |            type: int
      |            +> [10, 12] Plus
      |            |  type: int
      |            |  +> [10, 12] Multiply
      |            |  |  type: int
      |            |  |  +> [10, 12] Int (5)
      |            |  |  |  type: int
      |            |  |  `> [10, 16] Int (4)
      |            |  |     type: int
      |            |  `> [10, 20] Modulo
      |            |     type: int
      |            |     +> [10, 20] Int (15)
      |            |     |  type: int
      |            |     `> [10, 25] Int (3)
      |            |        type: int
      |            `> [10, 29] Int (2)
      |               type: int
      `> ListInst [List with 0 elements]
