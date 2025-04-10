DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of B
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
   |      +> [4, 8] Identifier (A)
   |      |  definition: type defined at [1, 0], type=A
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [5, 10] DeclField (PUBLIC)
   |      |      +> [5, 4] Identifier (float)
   |      |      |  definition: type (builtin), type=float
   |      |      +> [5, 10] Identifier (x)
   |      |      |  definition: field defined at [5, 10], type=float
   |      |      `> NoInitialization
   |      `> ListDeclMethod [List with 0 elements]
   `> EmptyMain
