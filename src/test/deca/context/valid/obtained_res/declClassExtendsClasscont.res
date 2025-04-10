DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of B
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [2, 0] ListDeclClass [List with 2 elements]
   |  []> [1, 0] DeclClass
   |  ||  +> [1, 6] Identifier (A)
   |  ||  |  definition: type defined at [1, 0], type=A
   |  ||  +> [1, 7] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [2, 0] DeclClass
   |      +> [2, 6] Identifier (B)
   |      |  definition: type defined at [2, 0], type=B
   |      +> [2, 8] Identifier (A)
   |      |  definition: type defined at [1, 0], type=A
   |      +> ListDeclField [List with 0 elements]
   |      `> ListDeclMethod [List with 0 elements]
   `> EmptyMain
