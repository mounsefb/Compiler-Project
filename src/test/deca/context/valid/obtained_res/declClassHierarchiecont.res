DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of B
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of C
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of D
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of E
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [5, 0] ListDeclClass [List with 5 elements]
   |  []> [1, 0] DeclClass
   |  ||  +> [1, 6] Identifier (A)
   |  ||  |  definition: type defined at [1, 0], type=A
   |  ||  +> [1, 7] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [2, 0] DeclClass
   |  ||  +> [2, 6] Identifier (B)
   |  ||  |  definition: type defined at [2, 0], type=B
   |  ||  +> [2, 8] Identifier (A)
   |  ||  |  definition: type defined at [1, 0], type=A
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [3, 0] DeclClass
   |  ||  +> [3, 6] Identifier (C)
   |  ||  |  definition: type defined at [3, 0], type=C
   |  ||  +> [3, 8] Identifier (A)
   |  ||  |  definition: type defined at [1, 0], type=A
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [4, 0] DeclClass
   |  ||  +> [4, 6] Identifier (D)
   |  ||  |  definition: type defined at [4, 0], type=D
   |  ||  +> [4, 8] Identifier (B)
   |  ||  |  definition: type defined at [2, 0], type=B
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [5, 0] DeclClass
   |      +> [5, 6] Identifier (E)
   |      |  definition: type defined at [5, 0], type=E
   |      +> [5, 8] Identifier (D)
   |      |  definition: type defined at [4, 0], type=D
   |      +> ListDeclField [List with 0 elements]
   |      `> ListDeclMethod [List with 0 elements]
   `> EmptyMain
