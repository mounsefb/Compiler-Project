DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:40) - verify program: start
DEBUG fr.ensimag.deca.tree.ListDeclClass.verifyListClass(ListDeclClass.java:43) - verify listClass: start
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:45) - verify program: Pass 1 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:50) - verify program: Pass 2 end
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:36) - verify Main: start
DEBUG fr.ensimag.deca.tree.Main.verifyMain(Main.java:47) - verify Main: end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:57) - verify program: Pass 3 end
DEBUG fr.ensimag.deca.tree.Program.verifyProgram(Program.java:59) - verify program: end
`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 0 elements]
      `> ListInst [List with 2 elements]
         []> [8, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [8, 12] Plus
         ||         type: int
         ||         +> [8, 12] Plus
         ||         |  type: int
         ||         |  +> [8, 12] Int (1)
         ||         |  |  type: int
         ||         |  `> [8, 16] Int (2)
         ||         |     type: int
         ||         `> [8, 20] Int (3)
         ||            type: int
         []> [9, 4] Println
             `> ListExpr [List with 1 elements]
                []> [9, 12] Multiply
                    type: int
                    +> [9, 12] Multiply
                    |  type: int
                    |  +> [9, 12] Int (2)
                    |  |  type: int
                    |  `> [9, 16] Int (3)
                    |     type: int
                    `> [9, 20] Int (4)
                       type: int
