       IDENTIFICATION DIVISION.
       PROGRAM-ID. princip.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 WS-NOM       PIC X(20)       VALUE "Nom".
       01 WS-RESULT    PIC X(30).
       01 WS-COUNT     PIC 99.

       PROCEDURE DIVISION.

           CALL "greet" USING WS-NOM WS-RESULT.
           DISPLAY WS-RESULT.
           CALL "countchar" USING WS-NOM WS-COUNT.
           DISPLAY "Nb : " WS-COUNT

       STOP RUN.    
