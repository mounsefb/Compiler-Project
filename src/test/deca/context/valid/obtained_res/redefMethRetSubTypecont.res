DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of D
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of B
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of C
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [1, 0] Program
   +> [9, 0] ListDeclClass [List with 4 elements]
   |  []> [1, 0] DeclClass
   |  ||  +> [1, 6] Identifier (D)
   |  ||  |  definition: type defined at [1, 0], type=D
   |  ||  +> [1, 7] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [3, 0] DeclClass
   |  ||  +> [3, 6] Identifier (A)
   |  ||  |  definition: type defined at [3, 0], type=A
   |  ||  +> [3, 7] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [6, 0] DeclClass
   |  ||  +> [6, 6] Identifier (B)
   |  ||  |  definition: type defined at [6, 0], type=B
   |  ||  +> [6, 8] Identifier (A)
   |  ||  |  definition: type defined at [3, 0], type=A
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> [7, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [7, 4] DeclMethod
   |  ||         +> [7, 4] Identifier (A)
   |  ||         |  definition: type defined at [3, 0], type=A
   |  ||         +> [7, 6] Identifier (get)
   |  ||         |  definition: method defined at [7, 4], type=A
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [7, 11] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 0 elements]
   |  []> [9, 0] DeclClass
   |      +> [9, 6] Identifier (C)
   |      |  definition: type defined at [9, 0], type=C
   |      +> [9, 8] Identifier (B)
   |      |  definition: type defined at [6, 0], type=B
   |      +> ListDeclField [List with 0 elements]
   |      `> [12, 4] ListDeclMethod [List with 3 elements]
   |         []> [10, 4] DeclMethod
   |         ||  +> [10, 4] Identifier (A)
   |         ||  |  definition: type defined at [3, 0], type=A
   |         ||  +> [10, 6] Identifier (set)
   |         ||  |  definition: method defined at [10, 4], type=A
   |         ||  +> ListDeclParam [List with 0 elements]
   |         ||  `> [10, 11] MethodBody
   |         ||     +> ListDeclVar [List with 0 elements]
   |         ||     `> ListInst [List with 0 elements]
   |         []> [11, 4] DeclMethod
   |         ||  +> [11, 4] Identifier (int)
   |         ||  |  definition: type (builtin), type=int
   |         ||  +> [11, 8] Identifier (slut)
   |         ||  |  definition: method defined at [11, 4], type=int
   |         ||  +> ListDeclParam [List with 0 elements]
   |         ||  `> [11, 14] MethodBody
   |         ||     +> ListDeclVar [List with 0 elements]
   |         ||     `> ListInst [List with 0 elements]
   |         []> [12, 4] DeclMethod
   |             +> [12, 4] Identifier (C)
   |             |  definition: type defined at [9, 0], type=C
   |             +> [12, 6] Identifier (get)
   |             |  definition: method defined at [12, 4], type=C
   |             +> ListDeclParam [List with 0 elements]
   |             `> [12, 11] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 0 elements]
   `> EmptyMain
