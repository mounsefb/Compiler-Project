`> [2, 0] Program
   +> [2, 0] ListDeclClass [List with 1 elements]
   |  []> [2, 0] DeclClass
   |      +> [2, 6] Identifier (A)
   |      +> [2, 8] Identifier (Object)
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [3, 18] DeclField (PROTECTED)
   |      |      +> [3, 14] Identifier (int)
   |      |      +> [3, 18] Identifier (x)
   |      |      `> NoInitialization
   |      `> [7, 4] ListDeclMethod [List with 2 elements]
   |         []> [4, 4] DeclMethod
   |         ||  +> [4, 4] Identifier (int)
   |         ||  +> [4, 8] Identifier (getX)
   |         ||  +> ListDeclParam [List with 0 elements]
   |         ||  `> [4, 15] MethodBody
   |         ||     +> ListDeclVar [List with 0 elements]
   |         ||     `> ListInst [List with 1 elements]
   |         ||        []> [5, 8] Return
   |         ||            `> [5, 15] Identifier (x)
   |         []> [7, 4] DeclMethod
   |             +> [7, 4] Identifier (void)
   |             +> [7, 9] Identifier (setX)
   |             +> [7, 14] ListDeclParam [List with 1 elements]
   |             |  []> [7, 14] DeclParam
   |             |      +> [7, 14] Identifier (int)
   |             |      `> [7, 18] Identifier (x)
   |             `> [7, 21] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [8, 8] Assign
   |                       +> [8, 8] Selection
   |                       |  +> [8, 8] This
   |                       |  `> [8, 13] Identifier (x)
   |                       `> [8, 17] Identifier (x)
   `> [12, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [13, 8] DeclVar
      |      +> [13, 4] Identifier (A)
      |      +> [13, 6] Identifier (a)
      |      `> [13, 10] Initialization
      |         `> [13, 10] New
      |            +> [13, 14] Identifier (A)
      `> ListInst [List with 2 elements]
         []> [14, 4] MethodCall
         ||  +> [14, 4] Identifier (a)
         ||  +> [14, 6] Identifier (setX)
         ||  `> ListExpr [List with 1 elements]
         ||     []> [14, 11] Int (1)
         []> [15, 4] Println
             `> ListExpr [List with 2 elements]
                []> [15, 12] StringLiteral (a.getX() = )
                []> [15, 27] MethodCall
                    +> [15, 27] Identifier (a)
                    +> [15, 29] Identifier (getX)
                    `> ListExpr [List with 0 elements]
