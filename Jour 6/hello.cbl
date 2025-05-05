       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       PROCEDURE DIVISION.
       
      *Boucle itérant 5 fois pour afficher Bonjour 
       PERFORM 5 TIMES
           DISPLAY "Bonjour"
       END-PERFORM.
       
       STOP RUN.
       