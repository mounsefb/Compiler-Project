DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [1, 0] ListDeclClass [List with 1 elements]
   |  []> [1, 0] DeclClass
   |      +> [1, 6] Identifier (A)
   |      |  definition: type defined at [1, 0], type=A
   |      +> [1, 7] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 5 elements]
   |      |  []> [2, 10] DeclField (PUBLIC)
   |      |  ||  +> [2, 4] Identifier (int)
   |      |  ||  |  definition: type (builtin), type=int
   |      |  ||  +> [2, 8] Identifier (x)
   |      |  ||  |  definition: field defined at [2, 10], type=int
   |      |  ||  `> [2, 12] Initialization
   |      |  ||     `> [2, 12] Int (0)
   |      |  ||        type: int
   |      |  []> [3, 12] DeclField (PUBLIC)
   |      |  ||  +> [3, 4] Identifier (float)
   |      |  ||  |  definition: type (builtin), type=float
   |      |  ||  +> [3, 10] Identifier (y)
   |      |  ||  |  definition: field defined at [3, 12], type=float
   |      |  ||  `> [3, 14] Initialization
   |      |  ||     `> ConvFloat
   |      |  ||        type: float
   |      |  ||        `> [3, 14] Int (1)
   |      |  ||           type: int
   |      |  []> [4, 12] DeclField (PUBLIC)
   |      |  ||  +> [4, 4] Identifier (float)
   |      |  ||  |  definition: type (builtin), type=float
   |      |  ||  +> [4, 10] Identifier (z)
   |      |  ||  |  definition: field defined at [4, 12], type=float
   |      |  ||  `> [4, 14] Initialization
   |      |  ||     `> [4, 14] Float (1.1)
   |      |  ||        type: Float
   |      |  []> [5, 14] DeclField (PUBLIC)
   |      |  ||  +> [5, 4] Identifier (boolean)
   |      |  ||  |  definition: type (builtin), type=boolean
   |      |  ||  +> [5, 12] Identifier (w)
   |      |  ||  |  definition: field defined at [5, 14], type=boolean
   |      |  ||  `> [5, 16] Initialization
   |      |  ||     `> [5, 16] BooleanLiteral (true)
   |      |  ||        type: boolean
   |      |  []> [6, 14] DeclField (PUBLIC)
   |      |      +> [6, 4] Identifier (boolean)
   |      |      |  definition: type (builtin), type=boolean
   |      |      +> [6, 12] Identifier (d)
   |      |      |  definition: field defined at [6, 14], type=boolean
   |      |      `> [6, 16] Initialization
   |      |         `> [6, 16] BooleanLiteral (false)
   |      |            type: boolean
   |      `> ListDeclMethod [List with 0 elements]
   `> EmptyMain
