       IDENTIFICATION DIVISION.
       PROGRAM-ID. vip.
       AUTHOR Thomas Baudrin.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

      *Variable WS-TYPE quie est de type alphanumérique de 8 caractères
      *Variable WS-SOLD qui est un entier de 9 chiffres
       WORKING-STORAGE SECTION.
       01 WS-TYPE            PIC 9(1).
       01 WS-SOLD            PIC 9(9).   

       PROCEDURE DIVISION.

      *Affiche une instruction puis laisse laisse l'utilisateur saisir 
      *    la valeur de WS-TYPE en choisissant 1 ou 2
           DISPLAY "Entrez le type de client : ".
           DISPLAY "1- VIP ".
           DISPLAY "2- Standard ".
           ACCEPT WS-TYPE.

      *Affiche une instruction puis laisse laisse l'utilisateur saisir 
      *    la valeur de WS-SOLD
           DISPLAY "Entrez le solde du client : ".
           ACCEPT WS-SOLD.

      *Condition vérifiant le type du client ainsi que son solde
           EVALUATE TRUE ALSO TRUE
               WHEN WS-TYPE = 1 ALSO WS-SOLD > 10000
                  DISPLAY "Prenium"
               WHEN WS-TYPE = 1 ALSO WS-SOLD <= 10000
                  DISPLAY "Privilégié"   
               WHEN WS-TYPE = 2 ALSO WS-SOLD > 5000
                  DISPLAY "Fidèle"    
               WHEN OTHER
                  DISPLAY "Standard"
           END-EVALUATE.

       STOP RUN.
           