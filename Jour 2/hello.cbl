       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello.
       AUTHOR Thomas Baudrin.

       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       01 NAMES     PIC X(20).

       PROCEDURE DIVISION.

           DISPLAY "Entrez votre nom :".
           ACCEPT NAMES .

           DISPLAY "Hello " FUNCTION TRIM(NAMES) ".".
           
           STOP RUN.
       