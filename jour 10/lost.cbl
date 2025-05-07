       IDENTIFICATION DIVISION.
       PROGRAM-ID. lost.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Variable contenant la taille de la suite saisi par l'utilisateur,
      *entier de 3 chiffres 
       01 WS-LENGTH      PIC 9(03).    
       01 WS-INDEX       PIC 9(03) VALUE 1.
       01 WS-NUM-1       PIC 9(05) VALUE 0.
       01 WS-NUM-2       PIC 9(05) VALUE 1.
       01 WS-RESULTAT    PIC 9(05).

       PROCEDURE DIVISION.
       DISPLAY "Entrez le nombre de termes attendu : ".
       ACCEPT WS-LENGTH

       IF WS-LENGTH < 1 THEN
           DISPLAY "Valeur invalide. Le nombre doit être >= 1."
       ELSE
           DISPLAY "Fibonacci : "
           DISPLAY WS-NUM-1
           DISPLAY WS-NUM-2      
           PERFORM UNTIL WS-INDEX = WS-LENGTH
               COMPUTE WS-RESULTAT = WS-NUM-1 + WS-NUM-2   
               DISPLAY WS-RESULTAT
               MOVE WS-NUM-2 TO WS-NUM-1  
               MOVE WS-RESULTAT TO WS-NUM-2  
               ADD 1 TO WS-INDEX
           END-PERFORM

       END-IF.

       STOP RUN.
