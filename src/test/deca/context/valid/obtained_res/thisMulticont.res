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
   |      +> [4, 8] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [5, 6] DeclField (PUBLIC)
   |      |      +> [5, 4] Identifier (A)
   |      |      |  definition: type defined at [1, 0], type=A
   |      |      +> [5, 6] Identifier (param)
   |      |      |  definition: field defined at [5, 6], type=A
   |      |      `> NoInitialization
   |      `> [6, 4] ListDeclMethod [List with 1 elements]
   |         []> [6, 4] DeclMethod
   |             +> [6, 4] Identifier (int)
   |             |  definition: type (builtin), type=int
   |             +> [6, 8] Identifier (getX)
   |             |  definition: method defined at [6, 4], type=int
   |             +> ListDeclParam [List with 0 elements]
   |             `> [6, 14] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [7, 8] Return
   |                       `> [7, 15] Selection
   |                          type: int
   |                          +> [7, 15] Selection
   |                          |  type: A
   |                          |  +> [7, 15] This
   |                          |  |  type: B
   |                          |  `> [7, 20] Identifier (param)
   |                          |     definition: field defined at [5, 6], type=A
   |                          `> [7, 26] Identifier (x)
   |                             definition: field defined at [2, 8], type=int
   `> EmptyMain
