`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 12] DeclVar
      |  ||  +> [8, 4] Identifier (float)
      |  ||  +> [8, 10] Identifier (y)
      |  ||  `> [8, 14] Initialization
      |  ||     `> [8, 14] Plus
      |  ||        +> [8, 14] Minus
      |  ||        |  +> [8, 14] Minus
      |  ||        |  |  +> [8, 14] Plus
      |  ||        |  |  |  +> [8, 14] Float (1.0)
      |  ||        |  |  |  `> [8, 20] Int (2)
      |  ||        |  |  `> [8, 24] Float (2.5)
      |  ||        |  `> [8, 30] Int (1)
      |  ||        `> [8, 34] Divide
      |  ||           +> [8, 34] Multiply
      |  ||           |  +> [8, 34] Int (10)
      |  ||           |  `> [8, 39] Float (5.2)
      |  ||           `> [8, 45] Int (10)
      |  []> [9, 10] DeclVar
      |      +> [9, 4] Identifier (float)
      |      +> [9, 10] Identifier (x)
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [10, 4] Assign
         ||  +> [10, 4] Identifier (x)
         ||  `> [10, 8] Plus
         ||     +> [10, 8] Minus
         ||     |  +> [10, 8] Minus
         ||     |  |  +> [10, 8] Plus
         ||     |  |  |  +> [10, 8] Float (1.0)
         ||     |  |  |  `> [10, 14] Int (2)
         ||     |  |  `> [10, 18] Float (2.5)
         ||     |  `> [10, 24] Int (1)
         ||     `> [10, 28] Divide
         ||        +> [10, 28] Multiply
         ||        |  +> [10, 28] Int (10)
         ||        |  `> [10, 33] Float (5.2)
         ||        `> [10, 39] Int (10)
         []> [11, 4] Println
             `> ListExpr [List with 1 elements]
                []> [11, 12] Identifier (x)
