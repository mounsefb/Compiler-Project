`> [8, 0] Program
   +> [8, 0] ListDeclClass [List with 1 elements]
   |  []> [8, 0] DeclClass
   |      +> [8, 6] Identifier (Produit)
   |      +> [8, 15] Identifier (Object)
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [10, 9] DeclField (PUBLIC)
   |      |      +> [10, 5] Identifier (int)
   |      |      +> [10, 9] Identifier (a)
   |      |      `> NoInitialization
   |      `> [12, 4] ListDeclMethod [List with 1 elements]
   |         []> [12, 4] DeclMethod
   |             +> [12, 4] Identifier (int)
   |             +> [12, 8] Identifier (test)
   |             +> [12, 14] ListDeclParam [List with 1 elements]
   |             |  []> [12, 14] DeclParam
   |             |      +> [12, 14] Identifier (float)
   |             |      `> [12, 20] Identifier (x)
   |             `> [12, 23] MethodBody
   |                +> ListDeclVar [List with 1 elements]
   |                |  []> [13, 20] DeclVar
   |                |      +> [13, 8] Identifier (float)
   |                |      +> [13, 14] Identifier (inter)
   |                |      `> [13, 22] Initialization
   |                |         `> [13, 22] Plus
   |                |            +> [13, 22] Identifier (x)
   |                |            `> [13, 24] Int (1)
   |                `> ListInst [List with 1 elements]
   |                   []> [14, 8] IfThenElse
   |                       +> [14, 12] Greater
   |                       |  +> [14, 12] Identifier (inter)
   |                       |  `> [14, 20] Identifier (a)
   |                       +> ListInst [List with 1 elements]
   |                       |  []> [15, 12] Return
   |                       |      `> [15, 19] Identifier (inter)
   |                       `> ListInst [List with 1 elements]
   |                          []> [17, 12] Return
   |                              `> [17, 19] Identifier (a)
   `> EmptyMain
