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
         ||  `> [9, 8] Int (2)
         []> [10, 4] While
             +> [10, 11] BooleanLiteral (true)
             `> ListInst [List with 1 elements]
                []> [11, 8] Assign
                    +> [11, 8] Identifier (x)
                    `> [11, 12] Minus
                       +> [11, 12] Identifier (x)
                       `> [11, 16] Int (1)
