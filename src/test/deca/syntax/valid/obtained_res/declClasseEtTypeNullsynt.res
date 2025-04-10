`> [7, 0] Program
   +> [7, 0] ListDeclClass [List with 1 elements]
   |  []> [7, 0] DeclClass
   |      +> [7, 6] Identifier (Personne)
   |      +> [7, 15] Identifier (Object)
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [8, 18] DeclField (PROTECTED)
   |      |      +> [8, 14] Identifier (int)
   |      |      +> [8, 18] Identifier (age)
   |      |      `> NoInitialization
   |      `> [15, 4] ListDeclMethod [List with 2 elements]
   |         []> [10, 4] DeclMethod
   |         ||  +> [10, 4] Identifier (void)
   |         ||  +> [10, 9] Identifier (setAge)
   |         ||  +> [10, 16] ListDeclParam [List with 1 elements]
   |         ||  |  []> [10, 16] DeclParam
   |         ||  |      +> [10, 16] Identifier (int)
   |         ||  |      `> [10, 20] Identifier (age)
   |         ||  `> [10, 24] MethodBody
   |         ||     +> ListDeclVar [List with 0 elements]
   |         ||     `> ListInst [List with 1 elements]
   |         ||        []> [11, 8] Assign
   |         ||            +> [11, 8] Selection
   |         ||            |  +> [11, 8] This
   |         ||            |  `> [11, 13] Identifier (age)
   |         ||            `> [11, 19] Identifier (age)
   |         []> [15, 4] DeclMethod
   |             +> [15, 4] Identifier (void)
   |             +> [15, 9] Identifier (presenter)
   |             +> ListDeclParam [List with 0 elements]
   |             `> [15, 21] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [16, 8] IfThenElse
   |                       +> [16, 12] Equals
   |                       |  +> [16, 12] Selection
   |                       |  |  +> [16, 12] This
   |                       |  |  `> [16, 17] Identifier (age)
   |                       |  `> [16, 24] Null
   |                       +> ListInst [List with 1 elements]
   |                       |  []> [17, 12] Println
   |                       |      `> ListExpr [List with 1 elements]
   |                       |         []> [17, 20] StringLiteral (Nom non défini)
   |                       `> ListInst [List with 1 elements]
   |                          []> [19, 12] Println
   |                              `> ListExpr [List with 3 elements]
   |                                 []> [19, 20] StringLiteral ( et j'ai )
   |                                 []> [19, 34] Selection
   |                                 ||  +> [19, 34] This
   |                                 ||  `> [19, 39] Identifier (age)
   |                                 []> [19, 45] StringLiteral ( ans.)
   `> [24, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [26, 27] DeclVar
      |  ||  +> [26, 8] Identifier (Personne)
      |  ||  +> [26, 17] Identifier (personne1)
      |  ||  `> [26, 29] Initialization
      |  ||     `> [26, 29] New
      |  ||        +> [26, 33] Identifier (Personne)
      |  []> [27, 27] DeclVar
      |      +> [27, 8] Identifier (Personne)
      |      +> [27, 17] Identifier (personne2)
      |      `> [27, 29] Initialization
      |         `> [27, 29] New
      |            +> [27, 33] Identifier (Personne)
      `> ListInst [List with 3 elements]
         []> [28, 8] MethodCall
         ||  +> [28, 8] Identifier (personne1)
         ||  +> [28, 18] Identifier (setAge)
         ||  `> ListExpr [List with 1 elements]
         ||     []> [28, 25] Int (10)
         []> [29, 8] MethodCall
         ||  +> [29, 8] Identifier (personne1)
         ||  +> [29, 18] Identifier (presenter)
         ||  `> ListExpr [List with 0 elements]
         []> [32, 8] MethodCall
             +> [32, 8] Identifier (personne2)
             +> [32, 18] Identifier (setAge)
             `> ListExpr [List with 0 elements]
