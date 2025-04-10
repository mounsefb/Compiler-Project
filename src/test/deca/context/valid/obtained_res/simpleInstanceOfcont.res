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
   |      `> ListDeclMethod [List with 0 elements]
   `> [8, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [9, 8] DeclVar
      |      +> [9, 4] Identifier (A)
      |      |  definition: type defined at [7, 0], type=A
      |      +> [9, 6] Identifier (x)
      |      |  definition: variable defined at [9, 6], type=A
      |      `> [9, 10] Initialization
      |         `> [9, 10] Null
      |            type: null
      `> ListInst [List with 1 elements]
         []> [10, 4] IfThenElse
             +> [10, 7] InstanceOf
             |  type: boolean
             |  +> [10, 7] Identifier (x)
             |  |  definition: variable defined at [9, 6], type=A
             |  `> [10, 20] Identifier (A)
             |     definition: type defined at [7, 0], type=A
             +> ListInst [List with 1 elements]
             |  []> [11, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [11, 16] StringLiteral (OK)
             |             type: String
             `> ListInst [List with 1 elements]
                []> [14, 8] Println
                    `> ListExpr [List with 1 elements]
                       []> [14, 16] StringLiteral (Oups)
                           type: String
