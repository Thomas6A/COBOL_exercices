       IDENTIFICATION DIVISION.
       PROGRAM-ID. fizzbuzz.
       AUTHOR Thomas Baudrin.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

      *Variable WS-NUMBER qui est un entier de 3 chiffres
      *Variable WS-RESULT qui est un entier de 1 Chiffre
      *Variable WS-REM-3 qui est un entier de 3 chiffres pour le reste
      *    de la division par 3
      *Variable WS-REM-5 qui est un entier de 3 Chiffres pour le reste
      *    de la division par 5
      *Variable WS-REM-15 qui est un entier de 3 Chiffres pour le reste 
      *    de la division par 15
       WORKING-STORAGE SECTION.
       01 WS-NUMBER            PIC 9(3).
       01 WS-RESULT            PIC 9(1).
       01 WS-REM-3             PIC 9(3).
       01 WS-REM-5             PIC 9(3).
       01 WS-REM-15            PIC 9(3).

       PROCEDURE DIVISION.
       
      *Boucle pour faire varier WS-NUMBER de 1 à 100 
       PERFORM VARYING WS-NUMBER FROM 1 BY 1 UNTIL WS-NUMBER > 100

      *Division de WS-NUMBER PAR 3, 5 et 15 afin d'avoir les restes
           DIVIDE WS-NUMBER BY 3 GIVING WS-RESULT REMAINDER WS-REM-3
           DIVIDE WS-NUMBER BY 5 GIVING WS-RESULT REMAINDER WS-REM-5
           DIVIDE WS-NUMBER BY 15 GIVING WS-RESULT REMAINDER WS-REM-15 

      *Condition pour savoir si on affiche fuzz, buzz, fuzzbuzz ou 
      *    WS-NUMBER selon par quoi WS-NUMBER est divisible
           IF WS-REM-15 = 0
              DISPLAY "FUZZBUZZ"
           ELSE IF WS-REM-5 = 0
              DISPLAY "BUZZ"
           ELSE IF WS-REM-3 = 0
              DISPLAY "FUZZ"
           ELSE 
              DISPLAY WS-NUMBER 
           END-IF

       END-PERFORM.

       STOP RUN.

