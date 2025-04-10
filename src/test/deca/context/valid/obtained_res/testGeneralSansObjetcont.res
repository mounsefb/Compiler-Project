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
      +> ListDeclVar [List with 4 elements]
      |  []> [9, 8] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [9, 8] Identifier (a)
      |  ||  |  definition: variable defined at [9, 8], type=int
      |  ||  `> NoInitialization
      |  []> [9, 11] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [9, 11] Identifier (b)
      |  ||  |  definition: variable defined at [9, 11], type=int
      |  ||  `> NoInitialization
      |  []> [10, 12] DeclVar
      |  ||  +> [10, 4] Identifier (boolean)
      |  ||  |  definition: type (builtin), type=boolean
      |  ||  +> [10, 12] Identifier (condition)
      |  ||  |  definition: variable defined at [10, 12], type=boolean
      |  ||  `> NoInitialization
      |  []> [11, 10] DeclVar
      |      +> [11, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [11, 10] Identifier (pi)
      |      |  definition: variable defined at [11, 10], type=float
      |      `> NoInitialization
      `> ListInst [List with 11 elements]
         []> [14, 4] Assign
         ||  type: int
         ||  +> [14, 4] Identifier (a)
         ||  |  definition: variable defined at [9, 8], type=int
         ||  `> [14, 8] Int (5)
         ||     type: int
         []> [15, 4] Assign
         ||  type: int
         ||  +> [15, 4] Identifier (b)
         ||  |  definition: variable defined at [9, 11], type=int
         ||  `> [15, 8] Int (10)
         ||     type: int
         []> [16, 4] Assign
         ||  type: boolean
         ||  +> [16, 4] Identifier (condition)
         ||  |  definition: variable defined at [10, 12], type=boolean
         ||  `> [16, 16] BooleanLiteral (true)
         ||     type: boolean
         []> [17, 4] Assign
         ||  type: float
         ||  +> [17, 4] Identifier (pi)
         ||  |  definition: variable defined at [11, 10], type=float
         ||  `> [17, 9] Float (3.14)
         ||     type: Float
         []> [20, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [20, 12] Identifier (a)
         ||         definition: variable defined at [9, 8], type=int
         []> [21, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [21, 12] Identifier (b)
         ||         definition: variable defined at [9, 11], type=int
         []> [22, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [22, 12] Identifier (pi)
         ||         definition: variable defined at [11, 10], type=float
         []> [25, 4] While
         ||  +> [25, 11] Greater
         ||  |  type: boolean
         ||  |  +> [25, 11] Identifier (a)
         ||  |  |  definition: variable defined at [9, 8], type=int
         ||  |  `> [25, 15] Int (0)
         ||  |     type: int
         ||  `> ListInst [List with 2 elements]
         ||     []> [26, 8] Println
         ||     ||  `> ListExpr [List with 1 elements]
         ||     ||     []> [26, 16] Identifier (a)
         ||     ||         definition: variable defined at [9, 8], type=int
         ||     []> [27, 8] Assign
         ||         type: int
         ||         +> [27, 8] Identifier (a)
         ||         |  definition: variable defined at [9, 8], type=int
         ||         `> [27, 12] Minus
         ||            type: int
         ||            +> [27, 12] Identifier (a)
         ||            |  definition: variable defined at [9, 8], type=int
         ||            `> [27, 16] Int (1)
         ||               type: int
         []> [31, 4] IfThenElse
         ||  +> [31, 8] Greater
         ||  |  type: boolean
         ||  |  +> [31, 8] Identifier (b)
         ||  |  |  definition: variable defined at [9, 11], type=int
         ||  |  `> [31, 12] Int (5)
         ||  |     type: int
         ||  +> ListInst [List with 1 elements]
         ||  |  []> [32, 8] Println
         ||  |      `> ListExpr [List with 1 elements]
         ||  |         []> [32, 16] StringLiteral (b est supérieur à 5)
         ||  |             type: String
         ||  `> ListInst [List with 1 elements]
         ||     []> [34, 8] Println
         ||         `> ListExpr [List with 1 elements]
         ||            []> [34, 16] StringLiteral (b n'est pas supérieur à 5)
         ||                type: String
         []> [38, 4] IfThenElse
         ||  +> [38, 8] Lower
         ||  |  type: boolean
         ||  |  +> [38, 8] Identifier (b)
         ||  |  |  definition: variable defined at [9, 11], type=int
         ||  |  `> [38, 12] Int (0)
         ||  |     type: int
         ||  +> ListInst [List with 1 elements]
         ||  |  []> [39, 8] Println
         ||  |      `> ListExpr [List with 1 elements]
         ||  |         []> [39, 16] StringLiteral (b est inférieur à 0)
         ||  |             type: String
         ||  `> ListInst [List with 1 elements]
         ||     []> [41, 8] Println
         ||         `> ListExpr [List with 1 elements]
         ||            []> [41, 16] StringLiteral (b est positif)
         ||                type: String
         []> [45, 4] IfThenElse
             +> [45, 8] Greater
             |  type: boolean
             |  +> [45, 8] Identifier (b)
             |  |  definition: variable defined at [9, 11], type=int
             |  `> [45, 12] Int (17)
             |     type: int
             +> ListInst [List with 1 elements]
             |  []> [46, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [46, 16] StringLiteral (b est supérieur à 5)
             |             type: String
             `> ListInst [List with 1 elements]
                []> [47, 6] IfThenElse
                    +> [47, 15] Equals
                    |  type: boolean
                    |  +> [47, 15] Identifier (b)
                    |  |  definition: variable defined at [9, 11], type=int
                    |  `> [47, 20] Int (10)
                    |     type: int
                    +> ListInst [List with 1 elements]
                    |  []> [48, 8] Println
                    |      `> ListExpr [List with 2 elements]
                    |         []> [48, 16] StringLiteral (b est égale à )
                    |         ||  type: String
                    |         []> [48, 34] Identifier (b)
                    |             definition: variable defined at [9, 11], type=int
                    `> ListInst [List with 1 elements]
                       []> [50, 8] Println
                           `> ListExpr [List with 1 elements]
                              []> [50, 16] StringLiteral (b n'est pas supérieur à 5)
                                  type: String
