       IDENTIFICATION DIVISION.
       PROGRAM-ID. multi.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Variable WS-VAR qui est un entier de deux chiffres
       01 WS-VAR                     PIC 9(2).
      *Variable WS-USE qui est un entier de deux chiffres
       01 WS-USE                     PIC 9(2).
      *Variable WS-RESULT qui est un entier de trois chiffres
       01 WS-RESULT                  PIC 9(3).

       PROCEDURE DIVISION.
       
      *Suite d'instructions permettant à l'utilisateur de choisir un 
      *    nombre entre 1 et 99
           DISPLAY "Rentrez un nombre entre 1 et 99".
           ACCEPT WS-USE.

      *Boucle itérant WS-VAR de 1 à 11 exclus avec un pas de 1
           PERFORM VARYING WS-VAR FROM 1 BY 1 UNTIL WS-VAR = 11

      *Suite d'instructions permettant de multiplier WS-VAR et WS-USE 
      *    obtenant WS-RESULT et afficher le calcul
                  MULTIPLY WS-VAR BY WS-USE GIVING WS-RESULT
                  DISPLAY WS-USE " X " WS-VAR " = " WS-RESULT

           END-PERFORM.

       STOP RUN.
           
           
       