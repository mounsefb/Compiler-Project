DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of B
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [4, 0] ListDeclClass [List with 2 elements]
   |  []> [1, 0] DeclClass
   |  ||  +> [1, 6] Identifier (A)
   |  ||  |  definition: type defined at [1, 0], type=A
   |  ||  +> [1, 7] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 1 elements]
   |  ||  |  []> [2, 8] DeclField (PUBLIC)
   |  ||  |      +> [2, 4] Identifier (int)
   |  ||  |      |  definition: type (builtin), type=int
   |  ||  |      +> [2, 8] Identifier (x)
   |  ||  |      |  definition: field defined at [2, 8], type=int
   |  ||  |      `> NoInitialization
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [4, 0] DeclClass
   |      +> [4, 6] Identifier (B)
   |      |  definition: type defined at [4, 0], type=B
   |      +> [4, 7] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [5, 8] DeclField (PUBLIC)
   |      |      +> [5, 4] Identifier (int)
   |      |      |  definition: type (builtin), type=int
   |      |      +> [5, 8] Identifier (y)
   |      |      |  definition: field defined at [5, 8], type=int
   |      |      `> NoInitialization
   |      `> ListDeclMethod [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 8] DeclVar
      |  ||  +> [8, 4] Identifier (A)
      |  ||  |  definition: type defined at [1, 0], type=A
      |  ||  +> [8, 6] Identifier (a)
      |  ||  |  definition: variable defined at [8, 6], type=A
      |  ||  `> [8, 10] Initialization
      |  ||     `> [8, 10] New
      |  ||        type: A
      |  ||        +> [8, 14] Identifier (A)
      |  ||        |  definition: type defined at [1, 0], type=A
      |  []> [9, 8] DeclVar
      |      +> [9, 4] Identifier (B)
      |      |  definition: type defined at [4, 0], type=B
      |      +> [9, 6] Identifier (b)
      |      |  definition: variable defined at [9, 6], type=B
      |      `> [9, 10] Initialization
      |         `> [9, 10] New
      |            type: B
      |            +> [9, 14] Identifier (B)
      |            |  definition: type defined at [4, 0], type=B
      `> ListInst [List with 1 elements]
         []> [10, 4] IfThenElse
             +> [10, 7] Equals
             |  type: boolean
             |  +> [10, 7] Identifier (a)
             |  |  definition: variable defined at [8, 6], type=A
             |  `> [10, 12] Identifier (b)
             |     definition: variable defined at [9, 6], type=B
             +> ListInst [List with 1 elements]
             |  []> [11, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [11, 16] StringLiteral (Oups)
             |             type: String
             `> ListInst [List with 1 elements]
                []> [14, 8] Println
                    `> ListExpr [List with 1 elements]
                       []> [14, 16] StringLiteral (super!)
                           type: String
