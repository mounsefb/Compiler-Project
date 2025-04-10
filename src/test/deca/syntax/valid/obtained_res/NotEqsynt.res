`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 4 elements]
      |  []> [8, 10] DeclVar
      |  ||  +> [8, 4] Identifier (int)
      |  ||  +> [8, 8] Identifier (x)
      |  ||  `> [8, 12] Initialization
      |  ||     `> [8, 12] Int (1)
      |  []> [9, 10] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  +> [9, 8] Identifier (y)
      |  ||  `> [9, 12] Initialization
      |  ||     `> [9, 12] Int (2)
      |  []> [10, 15] DeclVar
      |  ||  +> [10, 4] Identifier (boolean)
      |  ||  +> [10, 12] Identifier (z1)
      |  ||  `> [10, 17] Initialization
      |  ||     `> [10, 17] NotEquals
      |  ||        +> [10, 17] Identifier (x)
      |  ||        `> [10, 22] Identifier (y)
      |  []> [11, 15] DeclVar
      |      +> [11, 4] Identifier (boolean)
      |      +> [11, 12] Identifier (z2)
      |      `> [11, 17] Initialization
      |         `> [11, 17] NotEquals
      |            +> [11, 17] Identifier (x)
      |            `> [11, 22] Int (10)
      `> ListInst [List with 0 elements]
