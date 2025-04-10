`> [10, 0] Program
   +> [16, 0] ListDeclClass [List with 2 elements]
   |  []> [10, 0] DeclClass
   |  ||  +> [10, 6] Identifier (Animal)
   |  ||  +> [10, 13] Identifier (Object)
   |  ||  +> ListDeclField [List with 0 elements]
   |  ||  `> [11, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [11, 4] DeclMethod
   |  ||         +> [11, 4] Identifier (void)
   |  ||         +> [11, 9] Identifier (crier)
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [11, 17] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [12, 8] Println
   |  ||                   `> ListExpr [List with 1 elements]
   |  ||                      []> [12, 16] StringLiteral (Certains animaux font du bruit.)
   |  []> [16, 0] DeclClass
   |      +> [16, 6] Identifier (Chien)
   |      +> [16, 12] Identifier (Animal)
   |      +> ListDeclField [List with 0 elements]
   |      `> [18, 4] ListDeclMethod [List with 1 elements]
   |         []> [18, 4] DeclMethod
   |             +> [18, 4] Identifier (void)
   |             +> [18, 9] Identifier (crier)
   |             +> ListDeclParam [List with 0 elements]
   |             `> [18, 17] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [19, 8] Println
   |                       `> ListExpr [List with 1 elements]
   |                          []> [19, 16] StringLiteral (Le chien aboie.)
   `> [24, 1] Main
      +> ListDeclVar [List with 3 elements]
      |  []> [26, 22] DeclVar
      |  ||  +> [26, 8] Identifier (Animal)
      |  ||  +> [26, 15] Identifier (animal)
      |  ||  `> [26, 24] Initialization
      |  ||     `> [26, 24] New
      |  ||        +> [26, 28] Identifier (Animal)
      |  []> [27, 20] DeclVar
      |  ||  +> [27, 8] Identifier (Chien)
      |  ||  +> [27, 14] Identifier (chien)
      |  ||  `> [27, 22] Initialization
      |  ||     `> [27, 22] New
      |  ||        +> [27, 26] Identifier (Chien)
      |  []> [28, 32] DeclVar
      |      +> [28, 8] Identifier (Animal)
      |      +> [28, 15] Identifier (animalPolymorphe)
      |      `> [28, 34] Initialization
      |         `> [28, 34] New
      |            +> [28, 38] Identifier (Chien)
      `> ListInst [List with 3 elements]
         []> [30, 8] MethodCall
         ||  +> [30, 8] Identifier (animal)
         ||  +> [30, 15] Identifier (crier)
         ||  `> ListExpr [List with 0 elements]
         []> [31, 8] MethodCall
         ||  +> [31, 8] Identifier (chien)
         ||  +> [31, 14] Identifier (crier)
         ||  `> ListExpr [List with 0 elements]
         []> [32, 8] MethodCall
             +> [32, 8] Identifier (animalPolymorphe)
             +> [32, 25] Identifier (crier)
             `> ListExpr [List with 0 elements]
