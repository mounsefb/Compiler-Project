`> [7, 0] Program
   +> [7, 0] ListDeclClass [List with 1 elements]
   |  []> [7, 0] DeclClass
   |      +> [7, 6] Identifier (A)
   |      +> [7, 7] Identifier (Object)
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [8, 8] DeclField (PUBLIC)
   |      |      +> [8, 4] Identifier (int)
   |      |      +> [8, 8] Identifier (beta)
   |      |      `> NoInitialization
   |      `> ListDeclMethod [List with 0 elements]
   `> [11, 0] Main
      +> ListDeclVar [List with 3 elements]
      |  []> [12, 14] DeclVar
      |  ||  +> [12, 4] Identifier (A)
      |  ||  +> [12, 6] Identifier (premier)
      |  ||  `> [12, 16] Initialization
      |  ||     `> [12, 16] New
      |  ||        +> [12, 20] Identifier (A)
      |  []> [13, 13] DeclVar
      |  ||  +> [13, 4] Identifier (A)
      |  ||  +> [13, 6] Identifier (second)
      |  ||  `> [13, 15] Initialization
      |  ||     `> [13, 15] New
      |  ||        +> [13, 19] Identifier (A)
      |  []> [14, 19] DeclVar
      |      +> [14, 4] Identifier (boolean)
      |      +> [14, 12] Identifier (compar)
      |      `> [14, 21] Initialization
      |         `> [14, 21] MethodCall
      |            +> [14, 21] Identifier (premier)
      |            +> [14, 29] Identifier (equals)
      |            `> ListExpr [List with 1 elements]
      |               []> [14, 36] Identifier (second)
      `> ListInst [List with 0 elements]
