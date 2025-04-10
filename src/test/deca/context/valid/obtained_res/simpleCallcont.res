DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.DeclClass.verifyClassBody(DeclClass.java:200) - Verifyng the class body of A
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [7, 0] Program
   +> [7, 0] ListDeclClass [List with 1 elements]
   |  []> [7, 0] DeclClass
   |      +> [7, 6] Identifier (A)
   |      |  definition: type defined at [7, 0], type=A
   |      +> [7, 7] Identifier (Object)
   |      |  definition: type (builtin), type=Object
   |      +> ListDeclField [List with 0 elements]
   |      `> [8, 4] ListDeclMethod [List with 1 elements]
   |         []> [8, 4] DeclMethod
   |             +> [8, 4] Identifier (void)
   |             |  definition: type (builtin), type=void
   |             +> [8, 9] Identifier (setX)
   |             |  definition: method defined at [8, 4], type=void
   |             +> ListDeclParam [List with 0 elements]
   |             `> [8, 15] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 0 elements]
   `> [10, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [11, 8] DeclVar
      |      +> [11, 4] Identifier (A)
      |      |  definition: type defined at [7, 0], type=A
      |      +> [11, 6] Identifier (a)
      |      |  definition: variable defined at [11, 6], type=A
      |      `> [11, 10] Initialization
      |         `> [11, 10] New
      |            type: A
      |            +> [11, 14] Identifier (A)
      |            |  definition: type defined at [7, 0], type=A
      `> ListInst [List with 1 elements]
         []> [12, 4] MethodCall
             type: void
             +> [12, 4] Identifier (a)
             |  definition: variable defined at [11, 6], type=A
             +> [12, 6] Identifier (setX)
             |  definition: method defined at [8, 4], type=void
             `> ListExpr [List with 0 elements]
