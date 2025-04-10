`> [8, 0] Program
   +> [28, 0] ListDeclClass [List with 4 elements]
   |  []> [8, 0] DeclClass
   |  ||  +> [8, 6] Identifier (Animal)
   |  ||  +> [8, 13] Identifier (Object)
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> [9, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [9, 4] DeclMethod
   |  ||         +> [9, 4] Identifier (void)
   |  ||         +> [9, 9] Identifier (faireDuBruit)
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [9, 24] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [10, 8] Print
   |  ||                   `> ListExpr [List with 1 elements]
   |  ||                      []> [10, 14] StringLiteral (Bruit d'animal)
   |  []> [14, 0] DeclClass
   |  ||  +> [14, 6] Identifier (Chien)
   |  ||  +> [14, 12] Identifier (Animal)
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> [16, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [16, 4] DeclMethod
   |  ||         +> [16, 4] Identifier (void)
   |  ||         +> [16, 9] Identifier (faireDuBruit)
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [16, 24] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [17, 8] Print
   |  ||                   `> ListExpr [List with 1 elements]
   |  ||                      []> [17, 14] StringLiteral (Aboyer)
   |  []> [21, 0] DeclClass
   |  ||  +> [21, 6] Identifier (Chat)
   |  ||  +> [21, 11] Identifier (Animal)
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> [23, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [23, 4] DeclMethod
   |  ||         +> [23, 4] Identifier (void)
   |  ||         +> [23, 9] Identifier (faireDuBruit)
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [23, 24] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [24, 8] Print
   |  ||                   `> ListExpr [List with 1 elements]
   |  ||                      []> [24, 14] StringLiteral (Miauler)
   |  []> [28, 0] DeclClass
   |      +> [28, 6] Identifier (TestObjet)
   |      +> [28, 16] Identifier (Object)
   |      +> ListDeclField [List with 0 elements]
   |      `> [30, 4] ListDeclMethod [List with 1 elements]
   |         []> [30, 4] DeclMethod
   |             +> [30, 4] Identifier (void)
   |             +> [30, 9] Identifier (main)
   |             +> ListDeclParam [List with 0 elements]
   |             `> [30, 16] MethodBody
   |                +> ListDeclVar [List with 1 elements]
   |                |  []> [31, 25] DeclVar
   |                |      +> [31, 8] Identifier (Animal)
   |                |      +> [31, 15] Identifier (monAnimal)
   |                |      `> [31, 27] Initialization
   |                |         `> [31, 27] New
   |                |            +> [31, 31] Identifier (Chien)
   |                `> ListInst [List with 3 elements]
   |                   []> [32, 8] MethodCall
   |                   ||  +> [32, 8] Identifier (monAnimal)
   |                   ||  +> [32, 18] Identifier (faireDuBruit)
   |                   ||  `> ListExpr [List with 0 elements]
   |                   []> [34, 8] Assign
   |                   ||  +> [34, 8] Identifier (monAnimal)
   |                   ||  `> [34, 20] New
   |                   ||     +> [34, 24] Identifier (Chat)
   |                   []> [35, 8] MethodCall
   |                       +> [35, 8] Identifier (monAnimal)
   |                       +> [35, 18] Identifier (faireDuBruit)
   |                       `> ListExpr [List with 0 elements]
   `> EmptyMain
