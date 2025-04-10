`> [8, 0] Program
   +> [17, 0] ListDeclClass [List with 2 elements]
   |  []> [8, 0] DeclClass
   |  ||  +> [8, 6] Identifier (A)
   |  ||  +> [8, 8] Identifier (Object)
   |  ||  +> ListDeclField [List with 1 elements]
   |  ||  |  []> [9, 8] DeclField (PUBLIC)
   |  ||  |      +> [9, 4] Identifier (int)
   |  ||  |      +> [9, 8] Identifier (eins)
   |  ||  |      `> NoInitialization
   |  ||  `> [12, 4] ListDeclMethod [List with 1 elements]
   |  ||     []> [12, 4] DeclMethod
   |  ||         +> [12, 4] Identifier (void)
   |  ||         +> [12, 9] Identifier (delacer)
   |  ||         +> [12, 18] ListDeclParam [List with 1 elements]
   |  ||         |  []> [12, 18] DeclParam
   |  ||         |      +> [12, 18] Identifier (int)
   |  ||         |      `> [12, 22] Identifier (tr)
   |  ||         `> [12, 25] MethodBody
   |  ||            +> ListDeclVar [List with 0 elements]
   |  ||            `> ListInst [List with 1 elements]
   |  ||               []> [13, 8] Assign
   |  ||                   +> [13, 8] Identifier (eins)
   |  ||                   `> [13, 15] Plus
   |  ||                      +> [13, 15] Identifier (eins)
   |  ||                      `> [13, 22] Identifier (tr)
   |  []> [17, 0] DeclClass
   |      +> [17, 6] Identifier (B)
   |      +> [17, 8] Identifier (A)
   |      +> ListDeclField [List with 1 elements]
   |      |  []> [18, 8] DeclField (PUBLIC)
   |      |      +> [18, 4] Identifier (int)
   |      |      +> [18, 8] Identifier (zwei)
   |      |      `> NoInitialization
   |      `> [20, 4] ListDeclMethod [List with 1 elements]
   |         []> [20, 4] DeclMethod
   |             +> [20, 4] Identifier (void)
   |             +> [20, 9] Identifier (amplifier)
   |             +> [20, 21] ListDeclParam [List with 1 elements]
   |             |  []> [20, 21] DeclParam
   |             |      +> [20, 21] Identifier (float)
   |             |      `> [20, 27] Identifier (z)
   |             `> [20, 29] MethodBody
   |                +> ListDeclVar [List with 0 elements]
   |                `> ListInst [List with 1 elements]
   |                   []> [21, 8] Assign
   |                       +> [21, 8] Identifier (zwei)
   |                       `> [21, 15] Plus
   |                          +> [21, 15] Identifier (zwei)
   |                          `> [21, 22] Multiply
   |                             +> [21, 22] Identifier (eins)
   |                             `> [21, 27] Identifier (z)
   `> [25, 0] Main
      +> ListDeclVar [List with 2 elements]
      |  []> [26, 15] DeclVar
      |  ||  +> [26, 4] Identifier (A)
      |  ||  +> [26, 6] Identifier (monObjet)
      |  ||  `> [26, 17] Initialization
      |  ||     `> [26, 17] New
      |  ||        +> [26, 21] Identifier (A)
      |  []> [27, 16] DeclVar
      |      +> [27, 4] Identifier (A)
      |      +> [27, 6] Identifier (mySpecial)
      |      `> [27, 18] Initialization
      |         `> [27, 18] New
      |            +> [27, 22] Identifier (B)
      `> ListInst [List with 0 elements]
