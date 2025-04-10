`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 3 elements]
      |  []> [8, 8] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  +> [8, 8] Identifier (a)
      |  ||  `> NoInitialization
      |  []> [9, 10] DeclVar
      |  ||  +> [9, 4] Identifier (float)
      |  ||  +> [9, 10] Identifier (b)
      |  ||  `> NoInitialization
      |  []> [10, 10] DeclVar
      |      +> [10, 4] Identifier (float)
      |      +> [10, 10] Identifier (c)
      |      `> NoInitialization
      `> ListInst [List with 3 elements]
         []> [11, 4] Assign
         ||  +> [11, 4] Identifier (c)
         ||  `> [11, 8] Float (6.0)
         []> [12, 4] Assign
         ||  +> [12, 4] Identifier (a)
         ||  `> [12, 8] Int (1)
         []> [13, 4] Assign
             +> [13, 4] Identifier (b)
             `> [13, 8] Minus
                +> [13, 8] Identifier (a)
                `> [13, 10] Identifier (c)
