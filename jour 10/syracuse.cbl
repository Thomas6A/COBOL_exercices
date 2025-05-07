       IDENTIFICATION DIVISION.
       PROGRAM-ID. syracuse.
       AUTHOR. THOMAS/Yassine.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
      *Variable ayant la saisi de l'utilisateur, entier de 4 chiffres 
       01 WS-INPUT        PIC 9(4).
      *Variable ayant le résultat de la division, entier de 4 chiffres 
       01 WS-RESULT       PIC 9(4).
      *Variable ayant le reste de la division, entier de 4 chiffres 
       01 WS-REMAINDER    PIC 9(4).

       PROCEDURE DIVISION.
       
      *Affichage des instructions et saisi de l'utilisateur pour 
      *WS-INPUT 
       DISPLAY "Saisir un nombre non null".
       ACCEPT WS-INPUT.
       
      *Boucle permettant la conjecture de syracuse 
       PERFORM UNTIL WS-INPUT = 1
           
      *Division permettant d'obtenir le reste     
           DIVIDE WS-INPUT BY 2 GIVING WS-RESULT REMAINDER WS-REMAINDER

      *Condition vérifiant si WS-INPUT est pair
           IF WS-REMAINDER = 0

      *Si pair on lui associe le résultat de la division     
              MOVE WS-RESULT TO WS-INPUT

           ELSE 

      *Sinon on le multiplie par 3 et on lui ajoute 1     
              COMPUTE WS-INPUT EQUAL WS-INPUT * 3 + 1

           END-IF

      *Affichage de WS-INPUT
           DISPLAY WS-INPUT

       END-PERFORM.

       STOP RUN.
