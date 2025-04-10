`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 4 elements]
      |  []> [9, 8] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  +> [9, 8] Identifier (a)
      |  ||  `> NoInitialization
      |  []> [9, 11] DeclVar
      |  ||  +> [9, 4] Identifier (int)
      |  ||  +> [9, 11] Identifier (b)
      |  ||  `> NoInitialization
      |  []> [10, 12] DeclVar
      |  ||  +> [10, 4] Identifier (boolean)
      |  ||  +> [10, 12] Identifier (condition)
      |  ||  `> NoInitialization
      |  []> [11, 10] DeclVar
      |      +> [11, 4] Identifier (float)
      |      +> [11, 10] Identifier (pi)
      |      `> NoInitialization
      `> ListInst [List with 11 elements]
         []> [14, 4] Assign
         ||  +> [14, 4] Identifier (a)
         ||  `> [14, 8] Int (5)
         []> [15, 4] Assign
         ||  +> [15, 4] Identifier (b)
         ||  `> [15, 8] Int (10)
         []> [16, 4] Assign
         ||  +> [16, 4] Identifier (condition)
         ||  `> [16, 16] BooleanLiteral (true)
         []> [17, 4] Assign
         ||  +> [17, 4] Identifier (pi)
         ||  `> [17, 9] Float (3.14)
         []> [20, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [20, 12] Identifier (a)
         []> [21, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [21, 12] Identifier (b)
         []> [22, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [22, 12] Identifier (pi)
         []> [25, 4] While
         ||  +> [25, 11] Greater
         ||  |  +> [25, 11] Identifier (a)
         ||  |  `> [25, 15] Int (0)
         ||  `> ListInst [List with 2 elements]
         ||     []> [26, 8] Println
         ||     ||  `> ListExpr [List with 1 elements]
         ||     ||     []> [26, 16] Identifier (a)
         ||     []> [27, 8] Assign
         ||         +> [27, 8] Identifier (a)
         ||         `> [27, 12] Minus
         ||            +> [27, 12] Identifier (a)
         ||            `> [27, 16] Int (1)
         []> [31, 4] IfThenElse
         ||  +> [31, 8] Greater
         ||  |  +> [31, 8] Identifier (b)
         ||  |  `> [31, 12] Int (5)
         ||  +> ListInst [List with 1 elements]
         ||  |  []> [32, 8] Println
         ||  |      `> ListExpr [List with 1 elements]
         ||  |         []> [32, 16] StringLiteral (b est supérieur à 5)
         ||  `> ListInst [List with 1 elements]
         ||     []> [34, 8] Println
         ||         `> ListExpr [List with 1 elements]
         ||            []> [34, 16] StringLiteral (b n'est pas supérieur à 5)
         []> [38, 4] IfThenElse
         ||  +> [38, 8] Lower
         ||  |  +> [38, 8] Identifier (b)
         ||  |  `> [38, 12] Int (0)
         ||  +> ListInst [List with 1 elements]
         ||  |  []> [39, 8] Println
         ||  |      `> ListExpr [List with 1 elements]
         ||  |         []> [39, 16] StringLiteral (b est inférieur à 0)
         ||  `> ListInst [List with 1 elements]
         ||     []> [41, 8] Println
         ||         `> ListExpr [List with 1 elements]
         ||            []> [41, 16] StringLiteral (b est positif)
         []> [45, 4] IfThenElse
             +> [45, 8] Greater
             |  +> [45, 8] Identifier (b)
             |  `> [45, 12] Int (17)
             +> ListInst [List with 1 elements]
             |  []> [46, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [46, 16] StringLiteral (b est supérieur à 5)
             `> ListInst [List with 1 elements]
                []> [47, 6] IfThenElse
                    +> [47, 15] Equals
                    |  +> [47, 15] Identifier (b)
                    |  `> [47, 20] Int (10)
                    +> ListInst [List with 1 elements]
                    |  []> [48, 8] Println
                    |      `> ListExpr [List with 2 elements]
                    |         []> [48, 16] StringLiteral (b est égale à )
                    |         []> [48, 34] Identifier (b)
                    `> ListInst [List with 1 elements]
                       []> [50, 8] Println
                           `> ListExpr [List with 1 elements]
                              []> [50, 16] StringLiteral (b n'est pas supérieur à 5)
