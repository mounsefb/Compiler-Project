`> [7, 0] Program
   +> ListDeclClass [List with 0 elements]
   `> [7, 0] Main
      +> ListDeclVar [List with 0 elements]
      `> ListInst [List with 2 elements]
         []> [8, 4] Println
         ||  `> ListExpr [List with 1 elements]
         ||     []> [8, 12] Plus
         ||         +> [8, 12] Plus
         ||         |  +> [8, 12] Int (1)
         ||         |  `> [8, 16] Int (2)
         ||         `> [8, 20] Int (3)
         []> [9, 4] Println
             `> ListExpr [List with 1 elements]
                []> [9, 12] Multiply
                    +> [9, 12] Multiply
                    |  +> [9, 12] Int (2)
                    |  `> [9, 16] Int (3)
                    `> [9, 20] Int (4)
