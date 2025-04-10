DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of B
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [8, 0] ListDeclClass [List with 2 elements]
   |  []> [1, 0] DeclClass
   |  ||  +> [1, 6] Identifier (A)
   |  ||  |  definition: type defined at [1, 0], type=A
   |  ||  +> [1, 7] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 2 elements]
   |  ||  |  []> [3, 8] DeclField (PUBLIC)
   |  ||  |  ||  +> [3, 4] Identifier (int)
   |  ||  |  ||  |  definition: type (builtin), type=int
   |  ||  |  ||  +> [3, 8] Identifier (x)
   |  ||  |  ||  |  definition: field defined at [3, 8], type=int
   |  ||  |  ||  `> NoInitialization
   |  ||  |  []> [4, 10] DeclField (PUBLIC)
   |  ||  |      +> [4, 4] Identifier (float)
   |  ||  |      |  definition: type (builtin), type=float
   |  ||  |      +> [4, 10] Identifier (y)
   |  ||  |      |  definition: field defined at [4, 10], type=float
   |  ||  |      `> NoInitialization
   |  ||  `> [5, 4] ListDeclMethod [List with 2 elements]
   |  ||     []> [2, 4] DeclMethod
   |  ||     ||  +> [2, 4] Identifier (void)
   |  ||     ||  |  definition: type (builtin), type=void
   |  ||     ||  +> [2, 9] Identifier (setX)
   |  ||     ||  |  definition: method defined at [2, 4], type=void
   |  ||     ||  +> ListDeclParam [List with 0 elements]
   |  ||     ||  `> [2, 15] MethodBody
   |  ||     ||     +> ListDeclVar [List with 0 elements]
   |  ||     ||     `> ListInst [List with 0 elements]
   |  ||     []> [5, 4] DeclMethod
   |  ||         +> [5, 4] Identifier (void)
   |  ||         |  definition: type (builtin), type=void
   |  ||         +> [5, 9] Identifier (setY)
   |  ||         |  definition: method defined at [5, 4], type=void
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [5, 15] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 0 elements]
   |  []> [8, 0] DeclClass
   |      +> [8, 6] Identifier (B)
   |      |  definition: type defined at [8, 0], type=B
   |      +> [8, 8] Identifier (A)
   |      |  definition: type defined at [1, 0], type=A
   |      +> ListDeclField [List with 2 elements]
   |      |  []> [9, 8] DeclField (PUBLIC)
   |      |  ||  +> [9, 4] Identifier (int)
   |      |  ||  |  definition: type (builtin), type=int
   |      |  ||  +> [9, 8] Identifier (x)
   |      |  ||  |  definition: field defined at [9, 8], type=int
   |      |  ||  `> NoInitialization
   |      |  []> [10, 8] DeclField (PUBLIC)
   |      |      +> [10, 4] Identifier (int)
   |      |      |  definition: type (builtin), type=int
   |      |      +> [10, 8] Identifier (y)
   |      |      |  definition: field defined at [10, 8], type=int
   |      |      `> NoInitialization
   |      `> [11, 4] ListDeclMethod [List with 1 elements]
   |         []> [11, 4] DeclMethod
   |             +> [11, 4] Identifier (void)
   |             |  definition: type (builtin), type=void
   |             +> [11, 9] Identifier (setY)
   |             |  definition: method defined at [11, 4], type=void
   |             +> ListDeclParam [List with 0 elements]
   |             `> [11, 15] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 0 elements]
   `> EmptyMain
