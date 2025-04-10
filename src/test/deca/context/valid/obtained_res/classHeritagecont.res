DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of B
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [8, 0] Program
   +> [9, 0] ListDeclClass [List with 2 elements]
   |  []> [8, 0] DeclClass
   |  ||  +> [8, 6] Identifier (A)
   |  ||  |  definition: type defined at [8, 0], type=A
   |  ||  +> [8, 7] Identifier (Object)
   |  ||  |  definition: type (builtin), type=Object
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> ListDeclMethod [List with 0 elements]
   |  []> [9, 0] DeclClass
   |      +> [9, 6] Identifier (B)
   |      |  definition: type defined at [9, 0], type=B
   |      +> [9, 8] Identifier (A)
   |      |  definition: type defined at [8, 0], type=A
   |      +> ListDeclField [List with 0 elements]
   |      `> ListDeclMethod [List with 0 elements]
   `> [12, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [13, 8] DeclVar
      |  ||  +> [13, 4] Identifier (A)
      |  ||  |  definition: type defined at [8, 0], type=A
      |  ||  +> [13, 6] Identifier (b)
      |  ||  |  definition: variable defined at [13, 6], type=A
      |  ||  `> [13, 10] Initialization
      |  ||     `> [13, 10] New
      |  ||        type: A
      |  ||        +> [13, 14] Identifier (A)
      |  ||        |  definition: type defined at [8, 0], type=A
      |  []> [14, 8] DeclVar
      |      +> [14, 4] Identifier (B)
      |      |  definition: type defined at [9, 0], type=B
      |      +> [14, 6] Identifier (a)
      |      |  definition: variable defined at [14, 6], type=B
      |      `> [14, 10] Initialization
      |         `> [14, 10] New
      |            type: B
      |            +> [14, 14] Identifier (B)
      |            |  definition: type defined at [9, 0], type=B
      `> ListInst [List with 1 elements]
         []> [15, 4] Assign
             type: A
             +> [15, 4] Identifier (b)
             |  definition: variable defined at [13, 6], type=A
             `> [15, 8] Cast
                type: A
                +> [15, 9] Identifier (A)
                |  definition: type defined at [8, 0], type=A
                `> [15, 12] Identifier (a)
                   definition: variable defined at [14, 6], type=B
