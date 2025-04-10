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
      `> ListInst [List with 4 elements]
         []> [11, 4] Assign
         ||  +> [11, 4] Identifier (c)
         ||  `> [11, 8] Int (5)
         []> [12, 4] Assign
         ||  +> [12, 4] Identifier (c)
         ||  `> [12, 8] Float (1.2)
         []> [13, 4] Assign
         ||  +> [13, 4] Identifier (a)
         ||  `> [13, 8] Int (1)
         []> [14, 4] Assign
             +> [14, 4] Identifier (b)
             `> [14, 8] Multiply
                +> [14, 8] Identifier (b)
                `> [14, 10] Identifier (c)
