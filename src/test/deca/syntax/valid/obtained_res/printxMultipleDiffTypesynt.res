`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [8, 9] DeclVar
      |      +> [8, 3] Identifier (int)
      |      +> [8, 7] Identifier (x)
      |      `> [8, 11] Initialization
      |         `> [8, 11] Int (1)
      `> ListInst [List with 1 elements]
         []> [9, 3] Print
             `> ListExpr [List with 5 elements]
                []> [9, 10] StringLiteral (Hello)
                []> [9, 19] StringLiteral (world)
                []> [9, 28] StringLiteral (!)
                []> [9, 33] Identifier (x)
                []> [9, 36] Multiply
                    +> [9, 36] Identifier (x)
                    `> [9, 40] Identifier (x)
