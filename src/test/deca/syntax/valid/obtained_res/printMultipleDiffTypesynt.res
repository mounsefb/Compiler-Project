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
                []> [9, 9] StringLiteral (Hello)
                []> [9, 18] StringLiteral (world)
                []> [9, 27] StringLiteral (!)
                []> [9, 32] Identifier (x)
                []> [9, 35] Multiply
                    +> [9, 35] Identifier (x)
                    `> [9, 39] Identifier (x)
