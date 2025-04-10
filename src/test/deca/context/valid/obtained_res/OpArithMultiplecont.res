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
      +> ListDeclVar [List with 1 elements]
      |  []> [9, 14] DeclVar
      |      +> [9, 4] Identifier (int)
      |      |  definition: type (builtin), type=int
      |      +> [9, 8] Identifier (somme)
      |      |  definition: variable defined at [9, 8], type=int
      |      `> [9, 16] Initialization
      |         `> [9, 16] Plus
      |            type: int
      |            +> [9, 16] Plus
      |            |  type: int
      |            |  +> [9, 16] Plus
      |            |  |  type: int
      |            |  |  +> [9, 16] Plus
      |            |  |  |  type: int
      |            |  |  |  +> [9, 16] Plus
      |            |  |  |  |  type: int
      |            |  |  |  |  +> [9, 16] Plus
      |            |  |  |  |  |  type: int
      |            |  |  |  |  |  +> [9, 16] Plus
      |            |  |  |  |  |  |  type: int
      |            |  |  |  |  |  |  +> [9, 16] Plus
      |            |  |  |  |  |  |  |  type: int
      |            |  |  |  |  |  |  |  +> [9, 16] Plus
      |            |  |  |  |  |  |  |  |  type: int
      |            |  |  |  |  |  |  |  |  +> [9, 16] Plus
      |            |  |  |  |  |  |  |  |  |  type: int
      |            |  |  |  |  |  |  |  |  |  +> [9, 16] Int (1)
      |            |  |  |  |  |  |  |  |  |  |  type: int
      |            |  |  |  |  |  |  |  |  |  `> [9, 20] Int (2)
      |            |  |  |  |  |  |  |  |  |     type: int
      |            |  |  |  |  |  |  |  |  `> [9, 24] Int (3)
      |            |  |  |  |  |  |  |  |     type: int
      |            |  |  |  |  |  |  |  `> [9, 28] Int (4)
      |            |  |  |  |  |  |  |     type: int
      |            |  |  |  |  |  |  `> [9, 32] Int (5)
      |            |  |  |  |  |  |     type: int
      |            |  |  |  |  |  `> [9, 36] Int (6)
      |            |  |  |  |  |     type: int
      |            |  |  |  |  `> [9, 40] Int (7)
      |            |  |  |  |     type: int
      |            |  |  |  `> [9, 44] Int (8)
      |            |  |  |     type: int
      |            |  |  `> [9, 48] Int (9)
      |            |  |     type: int
      |            |  `> [9, 52] Int (10)
      |            |     type: int
      |            `> [9, 57] Int (0)
      |               type: int
      `> ListInst [List with 0 elements]
