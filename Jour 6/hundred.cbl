       IDENTIFICATION DIVISION.
       PROGRAM-ID. hundred.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.

       WORKING-STORAGE SECTION.
      *Variable WS-VAR qui est un entier de 3 chiffres
       01 WS-VAR               PIC 9(3).
      *Variable WS-RESULT qui est un entier de 1 chiffre 
       01 WS-RESULT            PIC 9(1).
      *Variable WS-REM-3 qui est un entier de 3 chiffres
       01 WS-REM-3             PIC 9(3).
       
       PROCEDURE DIVISION.
       
      *Boucle itérant de 1 à 101 exclus avec un pas de 1
       PERFORM VARYING WS-VAR FROM 1 BY 1 UNTIL WS-VAR = 101

      *Division par 3 de WS-VAR permettant d'obtenir le reste
           DIVIDE WS-VAR BY 3 GIVING WS-RESULT REMAINDER WS-REM-3

      *Condition vérifiant si le reste est égal à zéro et afficher 
      *    WS-VAR dans ce cas
           IF WS-REM-3 = 0
              DISPLAY WS-VAR
           END-IF

       END-PERFORM.

       STOP RUN.
