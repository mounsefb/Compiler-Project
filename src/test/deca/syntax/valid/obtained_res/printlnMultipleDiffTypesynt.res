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
                []> [9, 11] StringLiteral (Hello)
                []> [9, 20] StringLiteral (world)
                []> [9, 29] StringLiteral (!)
                []> [9, 34] Identifier (x)
                []> [9, 37] Multiply
                    +> [9, 37] Identifier (x)
                    `> [9, 41] Identifier (x)
