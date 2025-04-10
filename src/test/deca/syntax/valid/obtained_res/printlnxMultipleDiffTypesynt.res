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
         []> [9, 3] Println
             `> ListExpr [List with 5 elements]
                []> [9, 12] StringLiteral (Hello)
                []> [9, 21] StringLiteral (world)
                []> [9, 30] StringLiteral (!)
                []> [9, 35] Identifier (x)
                []> [9, 38] Multiply
                    +> [9, 38] Identifier (x)
                    `> [9, 42] Identifier (x)
