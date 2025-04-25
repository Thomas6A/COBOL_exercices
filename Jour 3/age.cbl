       IDENTIFICATION DIVISION.
       PROGRAM-ID. age.
       AUTHOR Thomas Baudrin.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

      *Variable WS-AGE qui est un entier de deux chiffres
       WORKING-STORAGE SECTION.
       01 WS-AGE             PIC 9(2).

       PROCEDURE DIVISION.

      *Affiche une instruction puis laisse laisse l'utilisateur saisir 
      *    la valeur de WS-AGE
           DISPLAY "Entrez votre âge : ".
           ACCEPT WS-AGE.

      *Condition vérifiants les différentes tranche d'âge 
      *    < 9, entre 10 et 19, entre 20 et 45 et plus de 45
           EVALUATE WS-AGE
               WHEN < 9
                  DISPLAY "Vous êtes un enfant"
               WHEN 10 thru 19
                  DISPLAY "Vous êtes un adolescent"
               WHEN 20 thru 45
                  DISPLAY "Vous êtes un adulte"
               WHEN OTHER
                  DISPLAY "Vous êtes un senior"
           END-EVALUATE.

           STOP RUN.
