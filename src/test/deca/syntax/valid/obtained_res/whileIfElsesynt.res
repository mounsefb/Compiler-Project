`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [8, 10] DeclVar
      |      +> [8, 4] Identifier (int)
      |      +> [8, 8] Identifier (x)
      |      `> [8, 12] Initialization
      |         `> [8, 12] Int (1)
      `> ListInst [List with 1 elements]
         []> [9, 4] While
             +> [9, 11] BooleanLiteral (true)
             `> ListInst [List with 1 elements]
                []> [10, 8] IfThenElse
                    +> [10, 12] Equals
                    |  +> [10, 12] Identifier (x)
                    |  `> [10, 17] Int (1)
                    +> ListInst [List with 1 elements]
                    |  []> [11, 12] Print
                    |      `> ListExpr [List with 1 elements]
                    |         []> [11, 18] Identifier (x)
                    `> ListInst [List with 0 elements]
