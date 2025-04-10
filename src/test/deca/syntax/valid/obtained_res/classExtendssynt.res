`> [8, 0] Program
   +> [21, 0] ListDeclClass [List with 2 elements]
   |  []> [8, 0] DeclClass
   |  ||  +> [8, 6] Identifier (A)
   |  ||  +> [8, 8] Identifier (Object)
   |  ||  +> ListDeclField [List with 2 elements]
   |  ||  |  []> [9, 8] DeclField (PUBLIC)
   |  ||  |  ||  +> [9, 4] Identifier (int)
   |  ||  |  ||  +> [9, 8] Identifier (x)
   |  ||  |  ||  `> NoInitialization
   |  ||  |  []> [11, 8] DeclField (PUBLIC)
   |  ||  |      +> [11, 4] Identifier (int)
   |  ||  |      +> [11, 8] Identifier (y)
   |  ||  |      `> NoInitialization
   |  ||  `> [13, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [13, 4] DeclMethod
   |  ||         +> [13, 4] Identifier (float)
   |  ||         +> [13, 10] Identifier (somme)
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [13, 18] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [14, 8] Return
   |  ||                   `> [14, 15] Plus
   |  ||                      +> [14, 15] Identifier (x)
   |  ||                      `> [14, 17] Identifier (y)
   |  []> [21, 0] DeclClass
   |      +> [21, 6] Identifier (B)
   |      +> [21, 8] Identifier (A)
   |      +> ListDeclField [List with 2 elements]
   |      |  []> [23, 9] DeclField (PUBLIC)
   |      |  ||  +> [23, 5] Identifier (int)
   |      |  ||  +> [23, 9] Identifier (z)
   |      |  ||  `> NoInitialization
   |      |  []> [25, 12] DeclField (PUBLIC)
   |      |      +> [25, 4] Identifier (boolean)
   |      |      +> [25, 12] Identifier (alpha)
   |      |      `> NoInitialization
   |      `> ListDeclMethod [List with 0 elements]
   `> EmptyMain
