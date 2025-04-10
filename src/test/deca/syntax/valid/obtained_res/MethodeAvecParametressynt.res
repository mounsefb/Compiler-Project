`> [8, 0] Program
   +> [8, 0] ListDeclClass [List with 1 elements]
   |  []> [8, 0] DeclClass
   |      +> [8, 6] Identifier (Point2D)
   |      +> [8, 14] Identifier (Object)
   |      +> ListDeclField [List with 2 elements]
   |      |  []> [10, 11] DeclField (PUBLIC)
   |      |  ||  +> [10, 5] Identifier (float)
   |      |  ||  +> [10, 11] Identifier (x)
   |      |  ||  `> NoInitialization
   |      |  []> [11, 11] DeclField (PUBLIC)
   |      |      +> [11, 5] Identifier (float)
   |      |      +> [11, 11] Identifier (y)
   |      |      `> NoInitialization
   |      `> [14, 4] ListDeclMethod [List with 1 elements]
   |         []> [14, 4] DeclMethod
   |             +> [14, 4] Identifier (void)
   |             +> [14, 9] Identifier (translate)
   |             +> [14, 28] ListDeclParam [List with 2 elements]
   |             |  []> [14, 20] DeclParam
   |             |  ||  +> [14, 20] Identifier (int)
   |             |  ||  `> [14, 24] Identifier (a)
   |             |  []> [14, 28] DeclParam
   |             |      +> [14, 28] Identifier (float)
   |             |      `> [14, 34] Identifier (b)
   |             `> [14, 36] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 2 elements]
   |                   []> [15, 8] Assign
   |                   ||  +> [15, 8] Identifier (x)
   |                   ||  `> [15, 12] Plus
   |                   ||     +> [15, 12] Identifier (x)
   |                   ||     `> [15, 16] Identifier (a)
   |                   []> [16, 8] Assign
   |                       +> [16, 8] Identifier (y)
   |                       `> [16, 12] Plus
   |                          +> [16, 12] Identifier (y)
   |                          `> [16, 16] Identifier (b)
   `> EmptyMain
