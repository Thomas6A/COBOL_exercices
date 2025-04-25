       IDENTIFICATION DIVISION.
       PROGRAM-ID. positif.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

      *Variable WS-NUM qui est un entier signé de neuf chiffres
       WORKING-STORAGE SECTION.
       01 WS-NUM             PIC S9(9).

       PROCEDURE DIVISION.

      *Affiche une instruction puis laisse laisse l'utilisateur saisir 
      *    la valeur de WS-NUM
           DISPLAY "Entrez le nombre : ".
           ACCEPT WS-NUM.

      *Condition vérifiant si le nombre est négatif sinon il est positif     
           IF WS-NUM < 0
              DISPLAY "Le nombre est négatif"
           ELSE 
              DISPLAY "Le nombre est positif"
           END-IF.

           STOP RUN.
