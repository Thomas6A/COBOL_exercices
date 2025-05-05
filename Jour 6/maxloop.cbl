       IDENTIFICATION DIVISION.
       PROGRAM-ID. maxloop.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.

       WORKING-STORAGE SECTION.
      *Variable WS-VAR qui est un entier de 2 chiffres
       01 WS-VAR      PIC 9(2)    VALUE 1.
      *Variable WS-MAX qui est un entier de 2 chiffres 
       01 WS-MAX      PIC 9(2)    VALUE 0.
       
       PROCEDURE DIVISION.
       
      *Boucle itérant jusqu'à ce que WS-VAR soit égal à 0
       PERFORM UNTIL WS-VAR = 0

      *Suite d'instruction permettant à l'utilisateur de choisir un
      *    nombre entre 0 et 99 et de l'associer à WS-VAR
           DISPLAY "Entrez un nombre entre 0 et 99"
           ACCEPT WS-VAR

      *Condition permettant de vérifier si WS-VAR est supérieur à WS-MAX
      *    et d'en associer la valeur si c'est le cas
           IF WS-VAR > WS-MAX
              MOVE WS-VAR TO WS-MAX
           END-IF

       END-PERFORM.

      *Instruction permettant d'afficher WS-MAX
       DISPLAY "La valeur max est de : " WS-MAX

       STOP RUN.
