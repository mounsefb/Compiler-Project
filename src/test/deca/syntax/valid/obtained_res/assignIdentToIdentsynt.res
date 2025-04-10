`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 10] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  +> [8, 8] Identifier (a)
      |  ||  `> [8, 12] Initialization
      |  ||     `> [8, 12] Int (1)
      |  []> [9, 8] DeclVar
      |      +> [9, 4] Identifier (int)
      |      +> [9, 8] Identifier (b)
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [10, 4] Assign
         ||  +> [10, 4] Identifier (b)
         ||  `> [10, 8] Identifier (a)
         []> [11, 4] Println
             `> ListExpr [List with 1 elements]
                []> [11, 12] Identifier (b)
