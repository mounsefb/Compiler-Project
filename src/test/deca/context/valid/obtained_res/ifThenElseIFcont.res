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
      |  []> [8, 8] DeclVar
      |      +> [8, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [8, 8] Identifier (x)
      |      |  definition: variable defined at [8, 8], type=int
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [9, 4] Assign
         ||  type: int
         ||  +> [9, 4] Identifier (x)
         ||  |  definition: variable defined at [8, 8], type=int
         ||  `> [9, 8] ReadInt
         ||     type: int
         []> [11, 4] IfThenElse
             +> [11, 7] Equals
             |  type: boolean
             |  +> [11, 7] Identifier (x)
             |  |  definition: variable defined at [8, 8], type=int
             |  `> [11, 12] Int (1)
             |     type: int
             +> ListInst [List with 1 elements]
             |  []> [12, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [12, 16] Identifier (x)
             |             definition: variable defined at [8, 8], type=int
             `> ListInst [List with 1 elements]
                []> [14, 4] IfThenElse
                    +> [14, 12] Equals
                    |  type: boolean
                    |  +> [14, 12] Identifier (x)
                    |  |  definition: variable defined at [8, 8], type=int
                    |  `> [14, 17] Int (2)
                    |     type: int
                    +> ListInst [List with 1 elements]
                    |  []> [15, 8] Println
                    |      `> ListExpr [List with 2 elements]
                    |         []> [15, 16] Multiply
                    |         ||  type: int
                    |         ||  +> [15, 16] Int (2)
                    |         ||  |  type: int
                    |         ||  `> [15, 18] Identifier (x)
                    |         ||     definition: variable defined at [8, 8], type=int
                    |         []> [15, 21] StringLiteral (C'est 2)
                    |             type: String
                    `> ListInst [List with 1 elements]
                       []> [17, 4] IfThenElse
                           +> [17, 12] Equals
                           |  type: boolean
                           |  +> [17, 12] Identifier (x)
                           |  |  definition: variable defined at [8, 8], type=int
                           |  `> [17, 17] Int (3)
                           |     type: int
                           +> ListInst [List with 1 elements]
                           |  []> [18, 8] Println
                           |      `> ListExpr [List with 2 elements]
                           |         []> [18, 16] Multiply
                           |         ||  type: int
                           |         ||  +> [18, 16] Int (3)
                           |         ||  |  type: int
                           |         ||  `> [18, 18] Identifier (x)
                           |         ||     definition: variable defined at [8, 8], type=int
                           |         []> [18, 21] StringLiteral (C'est 3)
                           |             type: String
                           `> ListInst [List with 1 elements]
                              []> [21, 8] Println
                                  `> ListExpr [List with 1 elements]
                                     []> [21, 16] Multiply
                                         type: int
                                         +> [21, 16] Identifier (x)
                                         |  definition: variable defined at [8, 8], type=int
                                         `> [21, 18] Identifier (x)
                                            definition: variable defined at [8, 8], type=int
