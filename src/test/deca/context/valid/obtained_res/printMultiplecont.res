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
      `> ListInst [List with 1 elements]
         []> [8, 3] Print
             `> ListExpr [List with 15 elements]
                []> [8, 9] StringLiteral (Hello)
                ||  type: String
                []> [8, 18] StringLiteral (world)
                ||  type: String
                []> [8, 27] StringLiteral (!)
                ||  type: String
                []> [8, 32] Int (3)
                ||  type: int
                []> [8, 35] UnaryMinus
                ||  type: int
                ||  `> [8, 36] Int (8)
                ||     type: int
                []> [8, 39] Int (1)
                ||  type: int
                []> [8, 42] UnaryMinus
                ||  type: int
                ||  `> [8, 43] Int (1)
                ||     type: int
                []> [8, 46] Int (1)
                ||  type: int
                []> [8, 49] UnaryMinus
                ||  type: int
                ||  `> [8, 50] Int (1)
                ||     type: int
                []> [8, 53] Int (1)
                ||  type: int
                []> [8, 56] UnaryMinus
                ||  type: int
                ||  `> [8, 57] Int (1)
                ||     type: int
                []> [8, 60] Int (1)
                ||  type: int
                []> [8, 63] UnaryMinus
                ||  type: int
                ||  `> [8, 64] Int (1)
                ||     type: int
                []> [8, 67] Int (1)
                ||  type: int
                []> [8, 70] UnaryMinus
                    type: int
                    `> [8, 71] Int (1)
                       type: int
