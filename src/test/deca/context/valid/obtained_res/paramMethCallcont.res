DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [7, 0] Program
   +> [7, 0] ListDeclClass [List with 1 elements]
   |  []> [7, 0] DeclClass
   |      +> [7, 6] Identifier (A)
   |      |  definition: type defined at [7, 0], type=A
   |      +> [7, 7] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [8, 10] DeclField (PUBLIC)
   |      |      +> [8, 4] Identifier (float)
   |      |      |  definition: type (builtin), type=float
   |      |      +> [8, 10] Identifier (x)
   |      |      |  definition: field defined at [8, 10], type=float
   |      |      `> NoInitialization
   |      `> [9, 4] ListDeclMethod [List with 1 elements]
   |         []> [9, 4] DeclMethod
   |             +> [9, 4] Identifier (void)
   |             |  definition: type (builtin), type=void
   |             +> [9, 9] Identifier (setX)
   |             |  definition: method defined at [9, 4], type=void
   |             +> [9, 14] ListDeclParam [List with 1 elements]
   |             |  []> [9, 14] DeclParam
   |             |      +> [9, 14] Identifier (float)
   |             |      |  definition: type (builtin), type=float
   |             |      `> [9, 20] Identifier (x)
   |             |         definition: parameter defined at [9, 14], type=float
   |             `> [9, 22] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [10, 8] Assign
   |                       type: float
   |                       +> [10, 8] Selection
   |                       |  type: float
   |                       |  +> [10, 8] This
   |                       |  |  type: A
   |                       |  `> [10, 13] Identifier (x)
   |                       |     definition: field defined at [8, 10], type=float
   |                       `> [10, 17] Identifier (x)
   |                          definition: parameter defined at [9, 14], type=float
   `> [13, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [14, 10] DeclVar
      |  ||  +> [14, 4] Identifier (int)
      |  ||  |  definition: type (builtin), type=int
      |  ||  +> [14, 8] Identifier (x)
      |  ||  |  definition: variable defined at [14, 8], type=int
      |  ||  `> [14, 12] Initialization
      |  ||     `> [14, 12] Int (10)
      |  ||        type: int
      |  []> [15, 8] DeclVar
      |      +> [15, 4] Identifier (A)
      |      |  definition: type defined at [7, 0], type=A
      |      +> [15, 6] Identifier (a)
      |      |  definition: variable defined at [15, 6], type=A
      |      `> [15, 10] Initialization
      |         `> [15, 10] New
      |            type: A
      |            +> [15, 14] Identifier (A)
      |            |  definition: type defined at [7, 0], type=A
      `> ListInst [List with 2 elements]
         []> [16, 4] MethodCall
         ||  type: void
         ||  +> [16, 4] Identifier (a)
         ||  |  definition: variable defined at [15, 6], type=A
         ||  +> [16, 6] Identifier (setX)
         ||  |  definition: method defined at [9, 4], type=void
         ||  `> ListExpr [List with 1 elements]
         ||     []> ConvFloat
         ||         type: float
         ||         `> [16, 11] Identifier (x)
         ||            definition: variable defined at [14, 8], type=int
         []> [17, 4] Println
             `> ListExpr [List with 1 elements]
                []> [17, 12] Selection
                    type: float
                    +> [17, 12] Identifier (a)
                    |  definition: variable defined at [15, 6], type=A
                    `> [17, 14] Identifier (x)
                       definition: field defined at [8, 10], type=float
