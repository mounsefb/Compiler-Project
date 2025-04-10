`> [8, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [8, 0] Main
      +> ListDeclVar [List with 3 elements]
      |  []> [9, 14] DeclVar
      |  ||  +> [9, 4] Identifier (boolean)
      |  ||  +> [9, 12] Identifier (x)
      |  ||  `> [9, 16] Initialization
      |  ||     `> [9, 16] BooleanLiteral (true)
      |  []> [10, 14] DeclVar
      |  ||  +> [10, 4] Identifier (boolean)
      |  ||  +> [10, 12] Identifier (y)
      |  ||  `> [10, 16] Initialization
      |  ||     `> [10, 16] BooleanLiteral (false)
      |  []> [11, 14] DeclVar
      |      +> [11, 4] Identifier (boolean)
      |      +> [11, 12] Identifier (z)
      |      `> [11, 16] Initialization
      |         `> [11, 16] Or
      |            +> [11, 16] Or
      |            |  +> [11, 16] Or
      |            |  |  +> [11, 16] Or
      |            |  |  |  +> [11, 16] Or
      |            |  |  |  |  +> [11, 16] Identifier (x)
      |            |  |  |  |  `> [11, 21] Identifier (y)
      |            |  |  |  `> [11, 26] Identifier (x)
      |            |  |  `> [11, 31] Identifier (y)
      |            |  `> [11, 36] Identifier (x)
      |            `> [11, 41] Identifier (y)
      `> ListInst [List with 1 elements]
         []> [13, 4] IfThenElse
             +> [13, 8] Identifier (z)
             +> ListInst [List with 1 elements]
             |  []> [14, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [14, 16] StringLiteral ( -->   Le test est valide)
             `> ListInst [List with 0 elements]
