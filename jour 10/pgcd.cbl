       IDENTIFICATION DIVISION.
       PROGRAM-ID. pgcd.
       AUTHOR. Thomas/Yassine.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 WS-INPUT-1    PIC 9(3).
       01 WS-INPUT-2    PIC 9(3).

       PROCEDURE DIVISION.
       
       DISPLAY "Saisir le premier nombre".
       ACCEPT WS-INPUT-1.
       
          
       DISPLAY "Saisir le deuxieme nombre".
       ACCEPT WS-INPUT-2.

       PERFORM UNTIL WS-INPUT-1 < WS-INPUT-2

           IF WS-INPUT-1 > WS-INPUT-2
              COMPUTE WS-INPUT-1 = WS-INPUT-1 - WS-INPUT-2
           ELSE 
              COMPUTE WS-INPUT-2 = WS-INPUT-2 - WS-INPUT-1 
           END-IF


       END-PERFORM.

           
       DISPLAY "Le PGCD est : " WS-INPUT-1.


       STOP RUN.

