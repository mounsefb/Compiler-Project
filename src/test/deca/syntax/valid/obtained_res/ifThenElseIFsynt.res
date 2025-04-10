`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [8, 8] DeclVar
      |      +> [8, 4] Identifier (int)
      |      +> [8, 8] Identifier (x)
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [9, 4] Assign
         ||  +> [9, 4] Identifier (x)
         ||  `> [9, 8] ReadInt
         []> [11, 4] IfThenElse
             +> [11, 7] Equals
             |  +> [11, 7] Identifier (x)
             |  `> [11, 12] Int (1)
             +> ListInst [List with 1 elements]
             |  []> [12, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [12, 16] Identifier (x)
             `> ListInst [List with 1 elements]
                []> [14, 4] IfThenElse
                    +> [14, 12] Equals
                    |  +> [14, 12] Identifier (x)
                    |  `> [14, 17] Int (2)
                    +> ListInst [List with 1 elements]
                    |  []> [15, 8] Println
                    |      `> ListExpr [List with 2 elements]
                    |         []> [15, 16] Multiply
                    |         ||  +> [15, 16] Int (2)
                    |         ||  `> [15, 18] Identifier (x)
                    |         []> [15, 21] StringLiteral (C'est 2)
                    `> ListInst [List with 1 elements]
                       []> [17, 4] IfThenElse
                           +> [17, 12] Equals
                           |  +> [17, 12] Identifier (x)
                           |  `> [17, 17] Int (3)
                           +> ListInst [List with 1 elements]
                           |  []> [18, 8] Println
                           |      `> ListExpr [List with 2 elements]
                           |         []> [18, 16] Multiply
                           |         ||  +> [18, 16] Int (3)
                           |         ||  `> [18, 18] Identifier (x)
                           |         []> [18, 21] StringLiteral (C'est 3)
                           `> ListInst [List with 1 elements]
                              []> [21, 8] Println
                                  `> ListExpr [List with 1 elements]
                                     []> [21, 16] Multiply
                                         +> [21, 16] Identifier (x)
                                         `> [21, 18] Identifier (x)
