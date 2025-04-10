DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [6, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [6, 0] Main
      +> ListDeclVar [List with 4 elements]
      |  []> [8, 8] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [8, 8] Identifier (n)
      |  ||  |  definition: variable defined at [8, 8], type=int
      |  ||  `> NoInitialization
      |  []> [9, 19] DeclVar
      |  ||  +> [9, 4] Identifier (boolean)
      |  ||  |  definition: type (builtin), type=boolean
      |  ||  +> [9, 12] Identifier (badInt)
      |  ||  |  definition: variable defined at [9, 12], type=boolean
      |  ||  `> [9, 21] Initialization
      |  ||     `> [9, 21] BooleanLiteral (true)
      |  ||        type: boolean
      |  []> [10, 12] DeclVar
      |  ||  +> [10, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [10, 8] Identifier (res)
      |  ||  |  definition: variable defined at [10, 8], type=int
      |  ||  `> [10, 14] Initialization
      |  ||     `> [10, 14] Int (1)
      |  ||        type: int
      |  []> [11, 10] DeclVar
      |      +> [11, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [11, 8] Identifier (i)
      |      |  definition: variable defined at [11, 8], type=int
      |      `> [11, 11] Initialization
      |         `> [11, 11] Int (1)
      |            type: int
      `> ListInst [List with 1 elements]
         []> [12, 4] While
             +> [12, 10] Identifier (badInt)
             |  definition: variable defined at [9, 12], type=boolean
             `> ListInst [List with 2 elements]
                []> [13, 8] Assign
                ||  type: int
                ||  +> [13, 8] Identifier (n)
                ||  |  definition: variable defined at [8, 8], type=int
                ||  `> [13, 11] ReadInt
                ||     type: int
                []> [14, 8] IfThenElse
                    +> [14, 12] Lower
                    |  type: boolean
                    |  +> [14, 12] Identifier (n)
                    |  |  definition: variable defined at [8, 8], type=int
                    |  `> [14, 16] Int (0)
                    |     type: int
                    +> ListInst [List with 2 elements]
                    |  []> [15, 12] Println
                    |  ||  `> ListExpr [List with 1 elements]
                    |  ||     []> [15, 20] StringLiteral (Erreur )
                    |  ||         type: String
                    |  []> [16, 12] Print
                    |      `> ListExpr [List with 1 elements]
                    |         []> [16, 18] StringLiteral (Re entrer un entier non nul)
                    |             type: String
                    `> ListInst [List with 3 elements]
                       []> [19, 12] Assign
                       ||  type: boolean
                       ||  +> [19, 12] Identifier (badInt)
                       ||  |  definition: variable defined at [9, 12], type=boolean
                       ||  `> [19, 21] BooleanLiteral (false)
                       ||     type: boolean
                       []> [20, 12] While
                       ||  +> [20, 18] LowerOrEqual
                       ||  |  type: boolean
                       ||  |  +> [20, 18] Identifier (i)
                       ||  |  |  definition: variable defined at [11, 8], type=int
                       ||  |  `> [20, 21] Identifier (n)
                       ||  |     definition: variable defined at [8, 8], type=int
                       ||  `> ListInst [List with 2 elements]
                       ||     []> [21, 16] Assign
                       ||     ||  type: int
                       ||     ||  +> [21, 16] Identifier (res)
                       ||     ||  |  definition: variable defined at [10, 8], type=int
                       ||     ||  `> [21, 22] Multiply
                       ||     ||     type: int
                       ||     ||     +> [21, 22] Identifier (res)
                       ||     ||     |  definition: variable defined at [10, 8], type=int
                       ||     ||     `> [21, 28] Identifier (i)
                       ||     ||        definition: variable defined at [11, 8], type=int
                       ||     []> [22, 16] Assign
                       ||         type: int
                       ||         +> [22, 16] Identifier (i)
                       ||         |  definition: variable defined at [11, 8], type=int
                       ||         `> [22, 20] Plus
                       ||            type: int
                       ||            +> [22, 20] Identifier (i)
                       ||            |  definition: variable defined at [11, 8], type=int
                       ||            `> [22, 23] Int (1)
                       ||               type: int
                       []> [24, 12] Println
                           `> ListExpr [List with 4 elements]
                              []> [24, 20] StringLiteral (Le factorielle de )
                              ||  type: String
                              []> [24, 42] Identifier (n)
                              ||  definition: variable defined at [8, 8], type=int
                              []> [24, 46] StringLiteral ( = )
                              ||  type: String
                              []> [24, 52] Identifier (res)
                                  definition: variable defined at [10, 8], type=int
