       IDENTIFICATION DIVISION.
       PROGRAM-ID. moyenne.
       AUTHOR Thomas Baudrin.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 FIRSTS             PIC S9(9).
       01 SECOND             PIC S9(9).
       01 THIRD              PIC S9(9).
       01 RESULTS            PIC S9(9)V99     VALUES 0.

       PROCEDURE DIVISION.
           DISPLAY "Entrez le premier nombre : ".
           ACCEPT FIRSTS.

           DISPLAY "Entrez le second nombre : ".
           ACCEPT SECOND.

           DISPLAY "Entrez le troisième nombre : ".
           ACCEPT THIRD.

           COMPUTE RESULTS = (FIRSTS + SECOND + THIRD)/3.
           
           DISPLAY "La moyenne de ces 3 nombres est égal à : " RESULTS.

           STOP RUN.
