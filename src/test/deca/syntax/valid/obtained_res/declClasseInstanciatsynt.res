`> [8, 0] Program
   +> [8, 0] ListDeclClass [List with 1 elements]
   |  []> [8, 0] DeclClass
   |      +> [8, 6] Identifier (Person)
   |      +> [8, 13] Identifier (Object)
   |      +> ListDeclField [List with 0 elements]
   |      `> [10, 4] ListDeclMethod [List with 1 elements]
   |         []> [10, 4] DeclMethod
   |             +> [10, 4] Identifier (void)
   |             +> [10, 9] Identifier (introduce)
   |             +> ListDeclParam [List with 0 elements]
   |             `> [10, 21] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [11, 8] Print
   |                       `> ListExpr [List with 1 elements]
   |                          []> [11, 14] StringLiteral (Je m'appelle Alice et j'ai 22 ans.)
   `> [15, 0] Main
      +> ListDeclVar [List with 0 elements]
      `> ListInst [List with 2 elements]
         []> [16, 4] Assign
         ||  +> [16, 4] Identifier (person)
         ||  `> [16, 13] New
         ||     +> [16, 17] Identifier (Person)
         []> [17, 4] MethodCall
             +> [17, 4] Identifier (person)
             +> [17, 11] Identifier (introduce)
             `> ListExpr [List with 0 elements]
