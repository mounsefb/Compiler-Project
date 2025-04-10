DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [8, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [8, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [9, 14] DeclVar
      |  ||  +> [9, 4] Identifier (boolean)
      |  ||  |  definition: type (builtin), type=boolean
      |  ||  +> [9, 12] Identifier (a)
      |  ||  |  definition: variable defined at [9, 12], type=boolean
      |  ||  `> [9, 16] Initialization
      |  ||     `> [9, 16] BooleanLiteral (false)
      |  ||        type: boolean
      |  []> [10, 14] DeclVar
      |      +> [10, 4] Identifier (boolean)
      |      |  definition: type (builtin), type=boolean
      |      +> [10, 12] Identifier (b)
      |      |  definition: variable defined at [10, 12], type=boolean
      |      `> [10, 16] Initialization
      |         `> [10, 16] BooleanLiteral (true)
      |            type: boolean
      `> ListInst [List with 1 elements]
         []> [11, 4] Assign
             type: boolean
             +> [11, 4] Identifier (b)
             |  definition: variable defined at [10, 12], type=boolean
             `> [11, 8] NotEquals
                type: boolean
                +> [11, 8] Identifier (a)
                |  definition: variable defined at [9, 12], type=boolean
                `> [11, 13] Identifier (b)
                   definition: variable defined at [10, 12], type=boolean
