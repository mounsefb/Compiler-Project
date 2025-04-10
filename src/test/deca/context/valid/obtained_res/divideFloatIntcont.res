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
      |  ||  +> [8, 10] Identifier (x)
      |  ||  |  definition: variable defined at [8, 10], type=float
      |  ||  `> [8, 14] Initialization
      |  ||     `> [8, 14] Divide
      |  ||        type: Float
      |  ||        +> [8, 14] Float (10.25)
      |  ||        |  type: Float
      |  ||        `> ConvFloat
      |  ||           type: float
      |  ||           `> [8, 22] Int (2)
      |  ||              type: int
      |  []> [9, 10] DeclVar
      |      +> [9, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [9, 10] Identifier (y)
      |      |  definition: variable defined at [9, 10], type=float
      |      `> NoInitialization
      `> ListInst [List with 1 elements]
         []> [10, 4] Assign
             type: float
             +> [10, 4] Identifier (y)
             |  definition: variable defined at [9, 10], type=float
             `> [10, 8] Divide
                type: Float
                +> [10, 8] Float (10.25)
                |  type: Float
                `> ConvFloat
                   type: float
                   `> [10, 16] Int (2)
                      type: int
