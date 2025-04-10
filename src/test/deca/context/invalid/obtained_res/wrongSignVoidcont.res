DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [8, 0] Program
   +> [8, 0] ListDeclClass [List with 1 elements]
   |  []> [8, 0] DeclClass
   |      +> [8, 6] Identifier (A)
   |      |  definition: type defined at [8, 0], type=A
   |      +> [8, 7] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [9, 8] DeclField (PUBLIC)
   |      |      +> [9, 4] Identifier (int)
   |      |      |  definition: type (builtin), type=int
   |      |      +> [9, 8] Identifier (x)
   |      |      |  definition: field defined at [9, 8], type=int
   |      |      `> NoInitialization
   |      `> [10, 4] ListDeclMethod [List with 1 elements]
   |         []> [10, 4] DeclMethod
   |             +> [10, 4] Identifier (void)
   |             |  definition: type (builtin), type=void
   |             +> [10, 9] Identifier (setX)
   |             |  definition: method defined at [10, 4], type=void
   |             +> [10, 14] ListDeclParam [List with 1 elements]
   |             |  []> [10, 14] DeclParam
   |             |      +> [10, 14] Identifier (int)
   |             |      |  definition: type (builtin), type=int
   |             |      `> [10, 18] Identifier (y)
   |             |         definition: parameter defined at [10, 14], type=int
   |             `> [10, 20] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [11, 8] Assign
   |                       type: int
   |                       +> [11, 8] Selection
   |                       |  type: int
   |                       |  +> [11, 8] This
   |                       |  |  type: A
   |                       |  `> [11, 13] Identifier (x)
   |                       |     definition: field defined at [9, 8], type=int
   |                       `> [11, 15] Identifier (x)
   |                          definition: field defined at [9, 8], type=int
   `> EmptyMain
