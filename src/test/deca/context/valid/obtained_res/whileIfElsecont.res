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
      |  []> [8, 10] DeclVar
      |      +> [8, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [8, 8] Identifier (x)
      |      |  definition: variable defined at [8, 8], type=int
      |      `> [8, 12] Initialization
      |         `> [8, 12] Int (1)
      |            type: int
      `> ListInst [List with 1 elements]
         []> [9, 4] While
             +> [9, 11] BooleanLiteral (true)
             |  type: boolean
             `> ListInst [List with 1 elements]
                []> [10, 8] IfThenElse
                    +> [10, 12] Equals
                    |  type: boolean
                    |  +> [10, 12] Identifier (x)
                    |  |  definition: variable defined at [8, 8], type=int
                    |  `> [10, 17] Int (1)
                    |     type: int
                    +> ListInst [List with 1 elements]
                    |  []> [11, 12] Print
                    |      `> ListExpr [List with 1 elements]
                    |         []> [11, 18] Identifier (x)
                    |             definition: variable defined at [8, 8], type=int
                    `> ListInst [List with 0 elements]
