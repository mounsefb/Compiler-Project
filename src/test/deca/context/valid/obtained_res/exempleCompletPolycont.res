DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [1, 0] ListDeclClass [List with 1 elements]
   |  []> [1, 0] DeclClass
   |      +> [1, 6] Identifier (A)
   |      |  definition: type defined at [1, 0], type=A
   |      +> [1, 7] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [2, 18] DeclField (PROTECTED)
   |      |      +> [2, 14] Identifier (int)
   |      |      |  definition: type (builtin), type=int
   |      |      +> [2, 18] Identifier (x)
   |      |      |  definition: field defined at [2, 18], type=int
   |      |      `> NoInitialization
   |      `> [6, 4] ListDeclMethod [List with 2 elements]
   |         []> [3, 4] DeclMethod
   |         ||  +> [3, 4] Identifier (int)
   |         ||  |  definition: type (builtin), type=int
   |         ||  +> [3, 8] Identifier (getX)
   |         ||  |  definition: method defined at [3, 4], type=int
   |         ||  +> ListDeclParam [List with 0 elements]
   |         ||  `> [3, 14] MethodBody
   |         ||     +> ListDeclVar [List with 0 elements]
   |         ||     `> ListInst [List with 1 elements]
   |         ||        []> [4, 8] Return
   |         ||            `> [4, 15] Identifier (x)
   |         ||               definition: field defined at [2, 18], type=int
   |         []> [6, 4] DeclMethod
   |             +> [6, 4] Identifier (int)
   |             |  definition: type (builtin), type=int
   |             +> [6, 8] Identifier (setX)
   |             |  definition: method defined at [6, 4], type=int
   |             +> [6, 13] ListDeclParam [List with 1 elements]
   |             |  []> [6, 13] DeclParam
   |             |      +> [6, 13] Identifier (int)
   |             |      |  definition: type (builtin), type=int
   |             |      `> [6, 17] Identifier (x)
   |             |         definition: parameter defined at [6, 13], type=int
   |             `> [6, 19] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 2 elements]
   |                   []> [7, 8] Assign
   |                   ||  type: int
   |                   ||  +> [7, 8] Selection
   |                   ||  |  type: int
   |                   ||  |  +> [7, 8] This
   |                   ||  |  |  type: A
   |                   ||  |  `> [7, 13] Identifier (x)
   |                   ||  |     definition: field defined at [2, 18], type=int
   |                   ||  `> [7, 17] Identifier (x)
   |                   ||     definition: parameter defined at [6, 13], type=int
   |                   []> [8, 8] Return
   |                       `> [8, 15] MethodCall
   |                          type: int
   |                          +> [8, 15] This
   |                          |  type: A
   |                          +> [8, 15] Identifier (getX)
   |                          |  definition: method defined at [3, 4], type=int
   |                          `> ListExpr [List with 0 elements]
   `> [12, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [13, 8] DeclVar
      |      +> [13, 4] Identifier (A)
      |      |  definition: type defined at [1, 0], type=A
      |      +> [13, 6] Identifier (a)
      |      |  definition: variable defined at [13, 6], type=A
      |      `> [13, 10] Initialization
      |         `> [13, 10] New
      |            type: A
      |            +> [13, 14] Identifier (A)
      |            |  definition: type defined at [1, 0], type=A
      `> ListInst [List with 2 elements]
         []> [14, 4] MethodCall
         ||  type: int
         ||  +> [14, 4] Identifier (a)
         ||  |  definition: variable defined at [13, 6], type=A
         ||  +> [14, 6] Identifier (setX)
         ||  |  definition: method defined at [6, 4], type=int
         ||  `> ListExpr [List with 1 elements]
         ||     []> [14, 11] Int (1)
         ||         type: int
         []> [15, 4] Println
             `> ListExpr [List with 2 elements]
                []> [15, 12] StringLiteral (a.getX() = )
                ||  type: String
                []> [15, 27] MethodCall
                    type: int
                    +> [15, 27] Identifier (a)
                    |  definition: variable defined at [13, 6], type=A
                    +> [15, 29] Identifier (getX)
                    |  definition: method defined at [3, 4], type=int
                    `> ListExpr [List with 0 elements]
