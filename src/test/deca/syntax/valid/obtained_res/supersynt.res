`> [10, 0] Program
   +> [16, 0] ListDeclClass [List with 2 elements]
   |  []> [10, 0] DeclClass
   |  ||  +> [10, 6] Identifier (Animal)
   |  ||  +> [10, 13] Identifier (Object)
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> [11, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [11, 4] DeclMethod
   |  ||         +> [11, 4] Identifier (void)
   |  ||         +> [11, 9] Identifier (manger)
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [11, 18] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [12, 8] Println
   |  ||                   `> ListExpr [List with 1 elements]
   |  ||                      []> [12, 16] StringLiteral (L'animal mange .)
   |  []> [16, 0] DeclClass
   |      +> [16, 6] Identifier (Chien)
   |      +> [16, 12] Identifier (Animal)
   |      +> ListDeclField [List with 0 elements]
   |      `> [17, 4] ListDeclMethod [List with 1 elements]
   |         []> [17, 4] DeclMethod
   |             +> [17, 4] Identifier (void)
   |             +> [17, 9] Identifier (manger)
   |             +> ListDeclParam [List with 0 elements]
   |             `> [17, 18] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 2 elements]
   |                   []> [18, 8] MethodCall
   |                   ||  +> [18, 8] Identifier (super)
   |                   ||  +> [18, 14] Identifier (manger)
   |                   ||  `> ListExpr [List with 0 elements]
   |                   []> [19, 8] Println
   |                       `> ListExpr [List with 1 elements]
   |                          []> [19, 16] StringLiteral ( de la viande.)
   `> EmptyMain
