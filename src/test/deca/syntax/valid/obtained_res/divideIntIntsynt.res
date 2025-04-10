`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 10] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  +> [8, 8] Identifier (x)
      |  ||  `> [8, 12] Initialization
      |  ||     `> [8, 12] Divide
      |  ||        +> [8, 12] Int (10)
      |  ||        `> [8, 17] Int (2)
      |  []> [9, 8] DeclVar
      |      +> [9, 4] Identifier (int)
      |      +> [9, 8] Identifier (y)
      |      `> NoInitialization
      `> ListInst [List with 1 elements]
         []> [10, 4] Assign
             +> [10, 4] Identifier (y)
             `> [10, 8] Divide
                +> [10, 8] Int (10)
                `> [10, 13] Int (2)
