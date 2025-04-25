       IDENTIFICATION DIVISION.
       PROGRAM-ID. pair.
       AUTHOR Thomas Baudrin.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

      *Variable WS-NUM qui est un entier de neuf chiffres
      *Variable WS-RESULT qui est un entier de neuf chiffres
      *Variable WS-REMAINDER qui est un entier de neuf chiffres
       WORKING-STORAGE SECTION.
       01 WS-NUM             PIC 9(9).
       01 WS-RESULT          PIC 9(9).
       01 WS-REMAINDER       PIC 9(9). 

       PROCEDURE DIVISION.

      *Affiche une instruction puis laisse laisse l'utilisateur saisir 
      *    la valeur de WS-NUM
           DISPLAY "Entrez le nombre : ".
           ACCEPT WS-NUM.

      *Divise WS-NUM par 2 pour obtenir les reste dans WS-REMAINDER
           DIVIDE 2 INTO WS-NUM GIVING WS-RESULT REMAINDER WS-REMAINDER.

      *Condition vérifiant si le reste est égal à 0 permettant de 
      *    vérifier si le nombre est pair
           IF WS-REMAINDER = 0
              DISPLAY "Le nombre est pair"
           ELSE
              DISPLAY "Le nombre est impair" 
           END-IF.

           STOP RUN.
