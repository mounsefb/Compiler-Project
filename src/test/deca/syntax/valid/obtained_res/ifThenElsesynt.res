`> [8, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [8, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [9, 8] DeclVar
      |      +> [9, 4] Identifier (int)
      |      +> [9, 8] Identifier (x)
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [10, 4] Assign
         ||  +> [10, 4] Identifier (x)
         ||  `> [10, 8] ReadInt
         []> [11, 4] IfThenElse
             +> [11, 7] Equals
             |  +> [11, 7] Identifier (x)
             |  `> [11, 12] Int (1)
             +> ListInst [List with 1 elements]
             |  []> [12, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [12, 16] Identifier (x)
             `> ListInst [List with 1 elements]
                []> [15, 7] Println
                    `> ListExpr [List with 3 elements]
                       []> [15, 15] Multiply
                       ||  +> [15, 15] Int (2)
                       ||  `> [15, 17] Identifier (x)
                       []> [15, 20] Multiply
                       ||  +> [15, 20] UnaryMinus
                       ||  |  `> [15, 21] Int (2)
                       ||  `> [15, 23] Identifier (x)
                       []> [15, 26] StringLiteral (Ce n'est pas 1)
