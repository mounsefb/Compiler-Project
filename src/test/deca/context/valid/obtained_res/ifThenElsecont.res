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
      |  []> [9, 8] DeclVar
      |      +> [9, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [9, 8] Identifier (x)
      |      |  definition: variable defined at [9, 8], type=int
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [10, 4] Assign
         ||  type: int
         ||  +> [10, 4] Identifier (x)
         ||  |  definition: variable defined at [9, 8], type=int
         ||  `> [10, 8] ReadInt
         ||     type: int
         []> [11, 4] IfThenElse
             +> [11, 7] Equals
             |  type: boolean
             |  +> [11, 7] Identifier (x)
             |  |  definition: variable defined at [9, 8], type=int
             |  `> [11, 12] Int (1)
             |     type: int
             +> ListInst [List with 1 elements]
             |  []> [12, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [12, 16] Identifier (x)
             |             definition: variable defined at [9, 8], type=int
             `> ListInst [List with 1 elements]
                []> [15, 7] Println
                    `> ListExpr [List with 3 elements]
                       []> [15, 15] Multiply
                       ||  type: int
                       ||  +> [15, 15] Int (2)
                       ||  |  type: int
                       ||  `> [15, 17] Identifier (x)
                       ||     definition: variable defined at [9, 8], type=int
                       []> [15, 20] Multiply
                       ||  type: int
                       ||  +> [15, 20] UnaryMinus
                       ||  |  type: int
                       ||  |  `> [15, 21] Int (2)
                       ||  |     type: int
                       ||  `> [15, 23] Identifier (x)
                       ||     definition: variable defined at [9, 8], type=int
                       []> [15, 26] StringLiteral (Ce n'est pas 1)
                           type: String
