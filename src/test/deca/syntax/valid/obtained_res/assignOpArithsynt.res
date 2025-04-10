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
         ||  `> [9, 8] Plus
         ||     +> [9, 8] Int (1)
         ||     `> [9, 12] Multiply
         ||        +> [9, 12] Int (2)
         ||        `> [9, 16] Int (3)
         []> [10, 4] Println
             `> ListExpr [List with 1 elements]
                []> [10, 12] Identifier (x)
