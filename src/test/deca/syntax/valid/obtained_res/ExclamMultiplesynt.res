`> [8, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [8, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [9, 14] DeclVar
      |  ||  +> [9, 4] Identifier (boolean)
      |  ||  +> [9, 12] Identifier (x)
      |  ||  `> [9, 16] Initialization
      |  ||     `> [9, 16] BooleanLiteral (true)
      |  []> [10, 14] DeclVar
      |      +> [10, 4] Identifier (boolean)
      |      +> [10, 12] Identifier (z)
      |      `> [10, 16] Initialization
      |         `> [10, 16] Not
      |            `> [10, 18] Not
      |               `> [10, 19] Not
      |                  `> [10, 20] Not
      |                     `> [10, 20] Identifier (x)
      `> ListInst [List with 1 elements]
         []> [12, 4] IfThenElse
             +> [12, 8] Identifier (z)
             +> ListInst [List with 1 elements]
             |  []> [13, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [13, 16] StringLiteral ( -->   Le test est valide)
             `> ListInst [List with 0 elements]
