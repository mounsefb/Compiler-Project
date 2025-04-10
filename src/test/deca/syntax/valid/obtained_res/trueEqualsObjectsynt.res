`> [1, 0] Program
   +> [1, 0] ListDeclClass [List with 1 elements]
   |  []> [1, 0] DeclClass
   |      +> [1, 6] Identifier (MyClass)
   |      +> [1, 14] Identifier (Object)
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [2, 8] DeclField (PUBLIC)
   |      |      +> [2, 4] Identifier (int)
   |      |      +> [2, 8] Identifier (value)
   |      |      `> NoInitialization
   |      `> ListDeclMethod [List with 0 elements]
   `> [5, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [6, 17] DeclVar
      |  ||  +> [6, 4] Identifier (MyClass)
      |  ||  +> [6, 12] Identifier (obj1)
      |  ||  `> [6, 19] Initialization
      |  ||     `> [6, 19] New
      |  ||        +> [6, 23] Identifier (MyClass)
      |  []> [7, 17] DeclVar
      |      +> [7, 4] Identifier (MyClass)
      |      +> [7, 12] Identifier (obj2)
      |      `> [7, 19] Initialization
      |         `> [7, 19] Identifier (obj1)
      `> ListInst [List with 1 elements]
         []> [8, 4] IfThenElse
             +> [8, 7] MethodCall
             |  +> [8, 7] Identifier (obj1)
             |  +> [8, 12] Identifier (equals)
             |  `> ListExpr [List with 1 elements]
             |     []> [8, 19] Identifier (obj2)
             +> ListInst [List with 1 elements]
             |  []> [9, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [9, 16] StringLiteral (ok)
             `> ListInst [List with 0 elements]
