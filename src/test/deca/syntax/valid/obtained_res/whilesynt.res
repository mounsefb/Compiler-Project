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
      `> ListInst [List with 3 elements]
         []> [10, 4] Assign
         ||  +> [10, 4] Identifier (x)
         ||  `> [10, 8] Int (2)
         []> [11, 4] While
         ||  +> [11, 11] GreaterOrEqual
         ||  |  +> [11, 11] Identifier (x)
         ||  |  `> [11, 16] Int (0)
         ||  `> ListInst [List with 2 elements]
         ||     []> [12, 8] Println
         ||     ||  `> ListExpr [List with 1 elements]
         ||     ||     []> [12, 16] Identifier (x)
         ||     []> [13, 8] Assign
         ||         +> [13, 8] Identifier (x)
         ||         `> [13, 12] Minus
         ||            +> [13, 12] Identifier (x)
         ||            `> [13, 16] Int (1)
         []> [16, 4] While
             +> [16, 11] GreaterOrEqual
             |  +> [16, 11] Identifier (y)
             |  `> [16, 16] Int (0)
             `> ListInst [List with 2 elements]
                []> [17, 8] Println
                ||  `> ListExpr [List with 1 elements]
                ||     []> [17, 16] Identifier (y)
                []> [18, 8] Assign
                    +> [18, 8] Identifier (y)
                    `> [18, 12] Minus
                       +> [18, 12] Identifier (y)
                       `> [18, 16] Int (1)
