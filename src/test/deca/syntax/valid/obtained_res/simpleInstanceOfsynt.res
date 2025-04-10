`> [1, 0] Program
   +> [1, 0] ListDeclClass [List with 1 elements]
   |  []> [1, 0] DeclClass
   |      +> [1, 6] Identifier (A)
   |      +> [1, 7] Identifier (Object)
   |      +> ListDeclField [List with 0 elements]
   |      `> ListDeclMethod [List with 0 elements]
   `> [2, 0] Main
      +> ListDeclVar [List with 1 elements]
      |  []> [3, 8] DeclVar
      |      +> [3, 4] Identifier (A)
      |      +> [3, 6] Identifier (a)
      |      `> [3, 10] Initialization
      |         `> [3, 10] New
      |            +> [3, 14] Identifier (A)
      `> ListInst [List with 1 elements]
         []> [4, 4] IfThenElse
             +> [4, 7] InstanceOf
             |  +> [4, 7] Identifier (a)
             |  `> [4, 20] Identifier (A)
             +> ListInst [List with 1 elements]
             |  []> [5, 8] Println
             |      `> ListExpr [List with 1 elements]
             |         []> [5, 16] StringLiteral (ok)
             `> ListInst [List with 0 elements]
