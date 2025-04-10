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
         []> [10, 4] Println
             `> ListExpr [List with 1 elements]
                []> [10, 12] Multiply
                    +> [10, 12] Float (0.5)
                    `> [10, 18] Multiply
                       +> [10, 19] Identifier (x)
                       `> [10, 23] Identifier (x)
