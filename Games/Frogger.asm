                00100   : ********** FREEWAY FROG **********
                00110   :
                00120   :
                00130   :
                00140   :
                00150   :
6978            00160               ORG         27000
                00170   :
6978    F3      00180   START       DI                  ;DISABLE BASIC SYSTEM AFFECTING
6979    D9      00190               EXX                 ;THE KEYBOARD SCANNING
697A    E5      00200               PUSH        HL      ;PRESERVE THE HL' REGISTER PAIR
697B    D9      00210               EXX                 ;POP BACK BEFORE RETURN
697C    CD836F  00220   AGAIN       CALL        INIT    ;INITIALISATION
697F    CDBD70  00230   MOVE        CALL        TFCTRL  ;TRAFFIC CONTROL ROUTINE
6982    CD5074  00240               CALL        RESPC   ;RESTORE UNDERNEATH
6985    CD0F71  00250               CALL        MOVTRF  ;MOVE TRAFFIC
6988    CD4A73  00260               CALL        POLICE  ;POLICE CAR ROUTINE
698B    CDC274  00270               CALL        FROG    ;FROG MODULE
698E    CD1D77  00280               CALL        CALSCR  ;CALCULATE AND DISPLAY SCORE
6991    CD8777  00290               CALL        SIREN   ;SIREN OR DELAY
6994    3A776F  00300               LD          A,(GAMFLG)  ;FINISH WHEN NO FROG
6997    A7      00310               AND         A
6998    2005    00320               JR          NZ,CONTIN
699A    CODE77  00330               CALL        OVER    ;HIGHSCORE MANAGEMENT
699D    1BDD    00340               JR          AGAIN   ;NEW GAME AGAIN
699F    3E7F    00350   CONTIN      LD          A,7FH   ;TRAP SPACE KEY PRESSED
69A1    DBFE    00360               IN          A,(0FEH)    ;SCAN KEYBOARD
69A3    E601    00370               AND         1
69A5    20D8    00380   JR          NZ,MOVE
69A7    CDFE77  00390               CALL        FINAL   ;RESET SCREEN AND BORDER COLOUR
69AA    D9      00400               EXX
69AB    E1      00410               POP         HL      ;RETRIEVE HL'
69AC    D9      00420               EXX
69AD    FB      00430               EI                  ;ENABLE INTERRUPTS
69AE    C9      00440               RET                 ;RETURN TO BASIC SYSTEM
                00450   ;
                00460   ;
69AF            00470