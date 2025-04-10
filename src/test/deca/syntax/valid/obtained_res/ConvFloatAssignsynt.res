`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 8] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  +> [8, 8] Identifier (a)
      |  ||  `> NoInitialization
      |  []> [9, 10] DeclVar
      |      +> [9, 4] Identifier (float)
      |      +> [9, 10] Identifier (b)
      |      `> NoInitialization
      `> ListInst [List with 2 elements]
         []> [10, 4] Assign
         ||  +> [10, 4] Identifier (a)
         ||  `> [10, 8] Int (1)
         []> [11, 4] Assign
             +> [11, 4] Identifier (b)
             `> [11, 8] Identifier (a)
