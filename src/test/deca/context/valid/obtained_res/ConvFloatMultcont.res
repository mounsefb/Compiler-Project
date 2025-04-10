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
      |  []> [8, 8] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [8, 8] Identifier (a)
      |  ||  |  definition: variable defined at [8, 8], type=int
      |  ||  `> NoInitialization
      |  []> [9, 10] DeclVar
      |  ||  +> [9, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [9, 10] Identifier (b)
      |  ||  |  definition: variable defined at [9, 10], type=float
      |  ||  `> NoInitialization
      |  []> [10, 10] DeclVar
      |      +> [10, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [10, 10] Identifier (c)
      |      |  definition: variable defined at [10, 10], type=float
      |      `> NoInitialization
      `> ListInst [List with 4 elements]
         []> [11, 4] Assign
         ||  type: float
         ||  +> [11, 4] Identifier (c)
         ||  |  definition: variable defined at [10, 10], type=float
         ||  `> ConvFloat
         ||     type: float
         ||     `> [11, 8] Int (5)
         ||        type: int
         []> [12, 4] Assign
         ||  type: float
         ||  +> [12, 4] Identifier (c)
         ||  |  definition: variable defined at [10, 10], type=float
         ||  `> [12, 8] Float (1.2)
         ||     type: Float
         []> [13, 4] Assign
         ||  type: int
         ||  +> [13, 4] Identifier (a)
         ||  |  definition: variable defined at [8, 8], type=int
         ||  `> [13, 8] Int (1)
         ||     type: int
         []> [14, 4] Assign
             type: float
             +> [14, 4] Identifier (b)
             |  definition: variable defined at [9, 10], type=float
             `> [14, 8] Multiply
                type: float
                +> [14, 8] Identifier (b)
                |  definition: variable defined at [9, 10], type=float
                `> [14, 10] Identifier (c)
                   definition: variable defined at [10, 10], type=float
