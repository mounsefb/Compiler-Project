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
      +> ListDeclVar [List with 1 elements]
      |  []> [9, 12] DeclVar
      |      +> [9, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [9, 10] Identifier (z)
      |      |  definition: variable defined at [9, 10], type=float
      |      `> [9, 14] Initialization
      |         `> [9, 14] ReadFloat
      |            type: Float
      `> ListInst [List with 1 elements]
         []> [10, 4] Println
             `> ListExpr [List with 1 elements]
                []> [10, 12] Plus
                    type: float
                    +> [10, 12] Identifier (z)
                    |  definition: variable defined at [9, 10], type=float
                    `> [10, 16] Float (0.1)
                       type: Float
