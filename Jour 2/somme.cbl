       IDENTIFICATION DIVISION.
       PROGRAM-ID. somme.
       AUTHOR Thomas Baudrin.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 FIRSTS             PIC 9(9).
       01 SECOND             PIC 9(9).
       01 RESULTS            PIC 9(9)     VALUES 0.
       01 VISUAL_RESULTS     PIC Z(8)9.

       PROCEDURE DIVISION.
           DISPLAY "Entrez le premier nombre : ".
           ACCEPT FIRSTS.

           DISPLAY "Entrez le second nombre : ".
           ACCEPT SECOND.

           ADD FIRSTS SECOND TO RESULTS.
           MOVE RESULTS TO VISUAL_RESULTS.
           
           DISPLAY FUNCTION TRIM(VISUAL_RESULTS).

           STOP RUN.
       

       