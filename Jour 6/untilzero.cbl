       IDENTIFICATION DIVISION.
       PROGRAM-ID. untilzero.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.

       WORKING-STORAGE SECTION.
      *Variable WS-VAR qui est un entier de 2 chiffres initialiser à 1
       01 WS-VAR        PIC 9(2)     VALUE 1.
       
       PROCEDURE DIVISION.
       
      *Boucle itérant jusqu'à ce que WS-VAR soit égal à 0.
      *WS-VAR est saisi par l'utilisateur à chaque itération
       PERFORM UNTIL WS-VAR = 0
           DISPLAY "Entrez un nombre ente 1 et 99 ou 0 pour quitter"
           ACCEPT WS-VAR
           DISPLAY "Vous avez entré " WS-VAR
       END-PERFORM.

       STOP RUN.
           