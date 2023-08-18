                00100   : ********** FREEWAY FROG **********
                00110   :
                00120   :
                00130   :
                00140   :
                00150   :
6978            00160               ORG         27000
                00170   :
6978    F3      00180   START       DI                  ; DISABLE BASIC SYSTEM AFFECTING
6979    D9      00190               EXX                 ; THE KEYBOARD SCANNING
697A    E5      00200               PUSH        HL      ;PRESERVE THE HL' REGISTER PAIR
697B    D9      00210               EXX                 ;POP BACK BEFORE RETURN
697C    CD836F  00220   AGAIN       CALL        INIT    ;INITIALISATION
697F    CDBD70  00230   MOVE        CALL        TFCTRL  ;TRAFFIC CONTROL ROUTINE
