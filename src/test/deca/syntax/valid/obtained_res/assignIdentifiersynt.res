`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 8] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  +> [8, 8] Identifier (x)
      |  ||  `> NoInitialization
      |  []> [9, 10] DeclVar
      |      +> [9, 4] Identifier (int)
      |      +> [9, 8] Identifier (y)
      |      `> [9, 12] Initialization
      |         `> [9, 12] Int (2)
      `> ListInst [List with 2 elements]
         []> [10, 4] Assign
         ||  +> [10, 4] Identifier (x)
         ||  `> [10, 8] Identifier (y)
         []> [11, 4] Println
             `> ListExpr [List with 1 elements]
                []> [11, 12] Identifier (y)
