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
      +> ListDeclVar [List with 4 elements]
      |  []> [9, 10] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [9, 8] Identifier (x)
      |  ||  |  definition: variable defined at [9, 8], type=int
      |  ||  `> [9, 12] Initialization
      |  ||     `> [9, 12] Int (8)
      |  ||        type: int
      |  []> [10, 10] DeclVar
      |  ||  +> [10, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [10, 8] Identifier (y)
      |  ||  |  definition: variable defined at [10, 8], type=int
      |  ||  `> [10, 12] Initialization
      |  ||     `> [10, 12] Int (12)
      |  ||        type: int
      |  []> [11, 15] DeclVar
      |  ||  +> [11, 4] Identifier (boolean)
      |  ||  |  definition: type (builtin), type=boolean
      |  ||  +> [11, 12] Identifier (z1)
      |  ||  |  definition: variable defined at [11, 12], type=boolean
      |  ||  `> [11, 17] Initialization
      |  ||     `> [11, 17] Equals
      |  ||        type: boolean
      |  ||        +> [11, 17] Identifier (x)
      |  ||        |  definition: variable defined at [9, 8], type=int
      |  ||        `> [11, 22] Identifier (y)
      |  ||           definition: variable defined at [10, 8], type=int
      |  []> [12, 15] DeclVar
      |      +> [12, 4] Identifier (boolean)
      |      |  definition: type (builtin), type=boolean
      |      +> [12, 12] Identifier (z2)
      |      |  definition: variable defined at [12, 12], type=boolean
      |      `> [12, 17] Initialization
      |         `> [12, 17] Equals
      |            type: boolean
      |            +> [12, 17] Identifier (x)
      |            |  definition: variable defined at [9, 8], type=int
      |            `> [12, 22] Int (10)
      |               type: int
      `> ListInst [List with 0 elements]
