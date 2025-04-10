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
      +> ListDeclVar [List with 1 elements]
      |  []> [8, 9] DeclVar
      |      +> [8, 3] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [8, 7] Identifier (x)
      |      |  definition: variable defined at [8, 7], type=int
      |      `> [8, 11] Initialization
      |         `> [8, 11] Int (1)
      |            type: int
      `> ListInst [List with 1 elements]
         []> [9, 3] Print
             `> ListExpr [List with 5 elements]
                []> [9, 9] StringLiteral (Hello)
                ||  type: String
                []> [9, 18] StringLiteral (world)
                ||  type: String
                []> [9, 27] StringLiteral (!)
                ||  type: String
                []> [9, 32] Identifier (x)
                ||  definition: variable defined at [8, 7], type=int
                []> [9, 35] Multiply
                    type: int
                    +> [9, 35] Identifier (x)
                    |  definition: variable defined at [8, 7], type=int
                    `> [9, 39] Identifier (x)
                       definition: variable defined at [8, 7], type=int
