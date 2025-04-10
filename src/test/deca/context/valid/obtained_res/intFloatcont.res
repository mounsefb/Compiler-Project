DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [7, 0] Program
   +> [7, 0] ListDeclClass [List with 1 elements]
   |  []> [7, 0] DeclClass
   |      +> [7, 6] Identifier (A)
   |      |  definition: type defined at [7, 0], type=A
   |      +> [7, 7] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 2 elements]
   |      |  []> [8, 12] DeclField (PUBLIC)
   |      |  ||  +> [8, 4] Identifier (float)
   |      |  ||  |  definition: type (builtin), type=float
   |      |  ||  +> [8, 10] Identifier (x)
   |      |  ||  |  definition: field defined at [8, 12], type=float
   |      |  ||  `> [8, 14] Initialization
   |      |  ||     `> [8, 14] Float (1.0)
   |      |  ||        type: Float
   |      |  []> [9, 10] DeclField (PUBLIC)
   |      |      +> [9, 4] Identifier (int)
   |      |      |  definition: type (builtin), type=int
   |      |      +> [9, 8] Identifier (y)
   |      |      |  definition: field defined at [9, 10], type=int
   |      |      `> [9, 12] Initialization
   |      |         `> [9, 12] Cast
   |      |            type: int
   |      |            +> [9, 13] Identifier (int)
   |      |            |  definition: type (builtin), type=int
   |      |            `> [9, 19] Identifier (x)
   |      |               definition: field defined at [8, 12], type=float
   |      `> ListDeclMethod [List with 0 elements]
   `> EmptyMain
