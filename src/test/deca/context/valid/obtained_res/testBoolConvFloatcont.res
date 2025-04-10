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
      +> ListDeclVar [List with 3 elements]
      |  []> [7, 10] DeclVar
      |  ||  +> [7, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [7, 8] Identifier (x)
      |  ||  |  definition: variable defined at [7, 8], type=int
      |  ||  `> [7, 12] Initialization
      |  ||     `> [7, 12] Int (1)
      |  ||        type: int
      |  []> [8, 12] DeclVar
      |  ||  +> [8, 4] Identifier (float)
      |  ||  |  definition: type (builtin), type=float
      |  ||  +> [8, 10] Identifier (y)
      |  ||  |  definition: variable defined at [8, 10], type=float
      |  ||  `> [8, 14] Initialization
      |  ||     `> [8, 14] Float (2.25)
      |  ||        type: Float
      |  []> [9, 12] DeclVar
      |      +> [9, 4] Identifier (float)
      |      |  definition: type (builtin), type=float
      |      +> [9, 10] Identifier (z)
      |      |  definition: variable defined at [9, 10], type=float
      |      `> [9, 14] Initialization
      |         `> [9, 14] Float (1.0)
      |            type: Float
      `> ListInst [List with 1 elements]
         []> [10, 4] IfThenElse
             +> [10, 8] Equals
             |  type: boolean
             |  +> ConvFloat
             |  |  type: float
             |  |  `> [10, 8] Identifier (x)
             |  |     definition: variable defined at [7, 8], type=int
             |  `> [10, 13] Identifier (z)
             |     definition: variable defined at [9, 10], type=float
             +> ListInst [List with 1 elements]
             |  []> [11, 8] Println
             |      `> ListExpr [List with 4 elements]
             |         []> [11, 16] StringLiteral (La conversion de x = )
             |         ||  type: String
             |         []> [11, 42] Identifier (x)
             |         ||  definition: variable defined at [7, 8], type=int
             |         []> [11, 46] StringLiteral ( en flotant c'est bien passer et ca valeur devient 1.0 qui est egale a z = )
             |         ||  type: String
             |         []> [11, 124] Identifier (z)
             |             definition: variable defined at [9, 10], type=float
             `> ListInst [List with 1 elements]
                []> [13, 4] IfThenElse
                    +> [13, 12] Greater
                    |  type: boolean
                    |  +> ConvFloat
                    |  |  type: float
                    |  |  `> [13, 12] Identifier (x)
                    |  |     definition: variable defined at [7, 8], type=int
                    |  `> [13, 14] Identifier (y)
                    |     definition: variable defined at [8, 10], type=float
                    +> ListInst [List with 1 elements]
                    |  []> [14, 8] Println
                    |      `> ListExpr [List with 1 elements]
                    |         []> [14, 16] StringLiteral (Mauvaise gestion car y > x)
                    |             type: String
                    `> ListInst [List with 0 elements]
