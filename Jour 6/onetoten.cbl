       IDENTIFICATION DIVISION.
       PROGRAM-ID. onetoten.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.

      *Variable WS-VAR qui est un entier de 2 chiffres
       WORKING-STORAGE SECTION.
       01 WS-VAR        PIC 9(2).
       
       PROCEDURE DIVISION.
       
      *Boucle itérant la variable WS-VAR de 1 jusqu'à 11 exclus de pas 1
      *    pour afficher la variable 
       PERFORM VARYING WS-VAR FROM 1 BY 1 UNTIL WS-VAR = 11
           DISPLAY WS-VAR
       END-PERFORM.
       STOP RUN.
