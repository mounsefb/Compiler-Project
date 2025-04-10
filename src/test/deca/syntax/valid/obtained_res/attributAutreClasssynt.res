`> [8, 0] Program
   +> [16, 0] ListDeclClass [List with 2 elements]
   |  []> [8, 0] DeclClass
   |  ||  +> [8, 6] Identifier (gl01)
   |  ||  +> [8, 12] Identifier (Object)
   |  ||  +> ListDeclField [List with 1 elements]
   |  ||  |  []> [10, 10] DeclField (PUBLIC)
   |  ||  |      +> [10, 4] Identifier (float)
   |  ||  |      +> [10, 10] Identifier (x)
   |  ||  |      `> NoInitialization
   |  ||  `> [11, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [11, 4] DeclMethod
   |  ||         +> [11, 4] Identifier (void)
   |  ||         +> [11, 9] Identifier (setGl)
   |  ||         +> ListDeclParam [List with 0 elements]
   |  ||         `> [11, 16] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [12, 8] Assign
   |  ||                   +> [12, 8] Identifier (x)
   |  ||                   `> [12, 10] Float (3.14)
   |  []> [16, 0] DeclClass
   |      +> [16, 6] Identifier (gl02)
   |      +> [16, 11] Identifier (Object)
   |      +> ListDeclField [List with 2 elements]
   |      |  []> [17, 9] DeclField (PUBLIC)
   |      |  ||  +> [17, 4] Identifier (gl01)
   |      |  ||  +> [17, 9] Identifier (prec)
   |      |  ||  `> NoInitialization
   |      |  []> [18, 12] DeclField (PUBLIC)
   |      |      +> [18, 4] Identifier (boolean)
   |      |      +> [18, 12] Identifier (zeta)
   |      |      `> NoInitialization
   |      `> [20, 4] ListDeclMethod [List with 1 elements]
   |         []> [20, 4] DeclMethod
   |             +> [20, 4] Identifier (void)
   |             +> [20, 9] Identifier (setGl)
   |             +> ListDeclParam [List with 0 elements]
   |             `> [20, 16] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 2 elements]
   |                   []> [21, 8] MethodCall
   |                   ||  +> [21, 8] Identifier (prec)
   |                   ||  +> [21, 13] Identifier (setGl)
   |                   ||  `> ListExpr [List with 0 elements]
   |                   []> [22, 8] Assign
   |                       +> [22, 8] Identifier (zeta)
   |                       `> [22, 13] BooleanLiteral (true)
   `> EmptyMain
