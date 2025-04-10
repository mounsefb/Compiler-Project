`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [8, 12] DeclVar
      |  ||  +> [8, 4] Identifier (float)
      |  ||  +> [8, 10] Identifier (x)
      |  ||  `> [8, 14] Initialization
      |  ||     `> [8, 14] Divide
      |  ||        +> [8, 14] Float (10.25)
      |  ||        `> [8, 22] Int (2)
      |  []> [9, 10] DeclVar
      |      +> [9, 4] Identifier (float)
      |      +> [9, 10] Identifier (y)
      |      `> NoInitialization
      `> ListInst [List with 1 elements]
         []> [10, 4] Assign
             +> [10, 4] Identifier (y)
             `> [10, 8] Divide
                +> [10, 8] Float (10.25)
                `> [10, 16] Int (2)
