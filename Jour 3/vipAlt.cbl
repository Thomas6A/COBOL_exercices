       IDENTIFICATION DIVISION.
       PROGRAM-ID. vipAlt.
       AUTHOR Thomas Baudrin.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

      *Variable WS-TYPE quie est de type alphanumérique de 8 caractères
      *Variable WS-SOLD qui est un entier de 9 chiffres
       WORKING-STORAGE SECTION.
       01 WS-TYPE            PIC 9(1)   VALUE 0.
       01 WS-SOLD            PIC 9(9).   

       PROCEDURE DIVISION.

      *Boucle pour choisir le type
       PERFORM UNTIL WS-TYPE = 1 or WS-TYPE = 2

      *Affiche une instruction puis laisse laisse l'utilisateur saisir 
      *    la valeur de WS-TYPE en choisissant 1 ou 2
           DISPLAY "Entrez le type de client : "
           DISPLAY "1- VIP "
           DISPLAY "2- Standard "
           ACCEPT WS-TYPE

       END-PERFORM.

      *Affiche une instruction puis laisse laisse l'utilisateur saisir 
      *    la valeur de WS-SOLD
           DISPLAY "Entrez le solde du client : ".
           ACCEPT WS-SOLD.

      *Condition vérifiant le type du client ainsi que son solde
           IF WS-TYPE = 1
              IF WS-SOLD > 10000
                 DISPLAY "Premium"
              ELSE
                 DISPLAY "Privilégié"
              END-IF
           ELSE
              IF WS-SOLD >5000
                 DISPLAY "Fidèle"
              ELSE
                 DISPLAY "Standard"
              END-IF
           END-IF.

       STOP RUN.
