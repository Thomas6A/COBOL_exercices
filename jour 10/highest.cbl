
      *Ecrire un programme qui demande à l'utilisateur de saisir 5 
      *nombres puis affiche le plus petit des nombres 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. highest.
       AUTHOR. Thomas B.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
      *Saisir la variable WS-INPUT pour saisir un numéro, maxi 3 
      *chiffres
       01 WS-INPUT    PIC 9(3).
      *saisir la variable WS-LOWEST pour sauveguarder le numéro le plus
      *petit des 5. 
       01 WS-LOWEST   PIC 9(3)    VALUE 999.

       PROCEDURE DIVISION.

      * Démarrer une boucle de cinq
       PERFORM 5 TIMES

      *Afficher l'action 'saisir un numéro'
           DISPLAY "Saisir un numéro"
           ACCEPT WS-INPUT
      *Condition si le numéro saisi et plus peti
           IF WS-INPUT < WS-LOWEST
               MOVE WS-INPUT TO WS-LOWEST
           END-IF
       
       END-PERFORM.

       STOP RUN.
       